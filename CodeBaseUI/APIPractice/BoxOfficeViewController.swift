//
//  BoxOfficeViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class BoxOfficeViewController: UIViewController {

    let textField = UITextField()
    let lineView = UIView()
    let picker = UIPickerView()
    let tableView = UITableView()
    let backgroundView = UIView()
    let backgroundImage = UIImageView()
    
    var dailyList: [DailyBoxOfficeList]?
    var dateList: [Date] = [] // firstDay = 20031111
    let dateFormatter = DateFormatter()
    
    
    override func viewWillAppear(_ animated: Bool) {
        let yesterDay = getYesterDayDate()
        getBoxOfficeData(yesterDay)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseSettings()
        setDateList()
        configHierarchy()
        configLayout()
        configUI()
    }
    
    func setBaseSettings() {
        textField.delegate = self
        picker.delegate = self
        picker.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BoxOfficeTableViewCell.self,
                           forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
        tableView.rowHeight = 40
    }
    
    func setDateList() {
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.dateStyle = .long
        
    }
    
    func getBoxOfficeData(_ dateStr: String) {
        textField.text = dateStr
        let baseURL = APIURL.boxOfficeURL
        let key = "?key=" + APIkey.boxOfficeKey
        let targetDt = "&targetDt=" + dateStr
        
        let url = baseURL + key + targetDt
        
        AF.request(url).responseDecodable(of: BoxOfficeResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.dailyList = value.boxOfficeResult.dailyBoxOfficeList
                print("SUCCESS: \(self.dailyList)")
                self.tableView.reloadData()
            case .failure(let error):
                print(#function + " 실패!!!\n \(error)")
                break
            }
        }
    }
        
    func getYesterDayDate() -> String {
        // 자정 이후 전일의 데이터가 DB에 인서트되기 전까지는 데이터를 불러오지 못함
        // 인서트되는 시간을 파악하여 시간설정 시에 예외처리하면 좋을 듯
        let today = Date()
        var yesterDate = today.addingTimeInterval(-86400)
    
        dateFormatter.dateFormat = "yyyyMMdd"
        var yesterDay = dateFormatter.string(from: yesterDate)
        
      return yesterDay
    }
    
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = dailyList?[indexPath.row] else {return UITableViewCell()}
        print("- \(indexPath.row): \(data)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier,
                                                 for: indexPath) as! BoxOfficeTableViewCell
        
        cell.configCell(data)
        
        return cell
    }
}


extension BoxOfficeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: dateList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateList[row]
        let dateStr  = dateFormatter.string(from: date)
        textField.text = dateStr
        getBoxOfficeData(dateStr)
    }
}

extension BoxOfficeViewController: UITextFieldDelegate {}


extension BoxOfficeViewController: CodeBaseUI {
    func configHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(backgroundView)
        view.addSubview(textField)
        view.addSubview(lineView)
        view.addSubview(tableView)
    }
    
    func configLayout() {
        backgroundImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        backgroundView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        textField.snp.makeConstraints{
            $0.height.equalTo(50)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        lineView.snp.makeConstraints{
            $0.height.equalTo(5)
            $0.top.equalTo(textField.snp.bottom)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        tableView.snp.makeConstraints{
            $0.top.equalTo(lineView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configUI() {
        self.navigationController?.navigationBar.tintColor = .white
       
        navigationItem.title = "박스오피스"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        let url = URL(string: "https://wallpapercave.com/wp/wp10021119.jpg")
        backgroundImage.kf.setImage(with: url)
        backgroundImage.contentMode = .scaleToFill
        
        backgroundView.backgroundColor = .black
        backgroundView.layer.opacity = 0.5
    
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.layer.addBorder([.bottom], color: .white, width: view.frame.width - 40)
        
        lineView.backgroundColor = .white
        
        tableView.backgroundColor = .clear
    }
    
    
}
