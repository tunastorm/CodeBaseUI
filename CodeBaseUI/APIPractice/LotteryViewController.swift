//
//  LotteryViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire


class LotteryViewController: UIViewController {
    
    let filterView = UIView()
    let resultView = UIView()
    
    let textField = UITextField()
    let noticeLabel = UILabel()
    let dateLabel = UILabel()
    
    let titleLabel = UILabel()
    lazy var ballStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    let bonusLabel = UILabel()

    var data: [Lotto] = []
    
    let picker = UIPickerView()

    var latestNo: Int = 1122
    var drwNoList: [Int] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, "view did Loaded")
        setDelegate()
        setDrwNoList()
        configHierarchy()
        configLayout()
        configUI()
        getLottoData(latestNo)
    }
    
    func setDelegate() {
        textField.delegate = self
        picker.delegate = self
        picker.dataSource = self
    }
    
    func setDrwNoList() {
        for i in 1...latestNo {
            drwNoList.append(i)
        }
    }
    
    func getLottoData(_ drwNo: Int) {
        let url = APIURL.lottoURL + String(drwNo)
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value): // value가 Lotto 구조체 형태로 변환됨=
                print("- drwNo: \(drwNo): \(value)")
                if value.returnValue == "fail" {
                    break
                }
                self.data.append(value)
                self.updateLottotUI(value)
            case .failure(let error):
                print(#function + " 실패!!!\n \(error)")
                break
            }
        }
        
    }
    
    func updateLottotUI(_ data: Lotto) {
        let drwtNoList = [data.drwtNo1, data.drwtNo2, data.drwtNo3,
                          data.drwtNo4, data.drwtNo5, data.drwtNo6, 0, data.bnusNo]
        configNoticeUI()
        configDateUI(data.drwNoDate)
        configResultTitleUI(data.drwNo)
        configBallStackUI(drwtNoList)
        configBonusUI()
    }
    
    func searchLotto(_ dwtNo: Int) {
        let resultArr = data.filter{
            $0.drwNo == dwtNo
        }
        if resultArr.isEmpty {
            getLottoData(dwtNo)
        } else {
            if let data = resultArr.first {
                updateLottotUI(data)
            }
        }
    }
}


extension LotteryViewController: UITextFieldDelegate {}

extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drwNoList.count

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(drwNoList[row])
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let drwNo = drwNoList[row]
        textField.text = String(drwNo)
        searchLotto(drwNo)
        print("select", component, row)
    }
}



extension LotteryViewController: CodeBaseUI {
  
    func configHierarchy() {
        view.addSubview(filterView)
        view.addSubview(resultView)
        filterView.addSubview(textField)
        filterView.addSubview(noticeLabel)
        filterView.addSubview(dateLabel)
        
        resultView.addSubview(titleLabel)
        resultView.addSubview(ballStackView)
        resultView.addSubview(bonusLabel)
        
        for i in 0...7 {
            let view = UIView()
            let label = UILabel()
                
            view.addSubview(label)
            
            label.snp.makeConstraints{
                $0.edges.equalToSuperview().inset(2)
            }
        
            ballStackView.addArrangedSubview(view)
            ballStackView.bringSubviewToFront(view)
        }
        
    }
    
    func configLayout() {
        filterView.snp.makeConstraints{
            $0.height.equalTo(view.frame.height * 0.2)
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        resultView.snp.makeConstraints{
            $0.height.equalTo(view.frame.height * 0.6)
            $0.top.equalTo(filterView.snp.bottom)
            $0.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        textField.snp.makeConstraints{
            $0.height.equalTo(50)
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        noticeLabel.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        dateLabel.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(20)
            $0.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        let titleWidth = view.frame.width * 0.4
        titleLabel.snp.makeConstraints{
            $0.height.equalTo(50)
            $0.width.equalTo(titleWidth)
            $0.top.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
        
        ballStackView.snp.makeConstraints{
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        for view in ballStackView.arrangedSubviews {
            
            view.snp.makeConstraints{
                $0.width.equalTo(44)
            }
        }
        
        bonusLabel.snp.makeConstraints{
            $0.height.equalTo(20)
            $0.width.equalTo(44)
            $0.top.equalTo(ballStackView.snp.bottom)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
    func configUI() {
        view.backgroundColor = .white
        configFilterViewUI()
        configTextFieldUI()
    }
    
    func configFilterViewUI() {
        filterView.layer.addBorder([.bottom], color: .lightGray, width: view.frame.width - 20)
    }
    
    func configTextFieldUI() {
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.font = .boldSystemFont(ofSize: 20)
        textField.inputView = picker
    }
    
    
    func configNoticeUI() {
        noticeLabel.text = "당첨번호 안내"
        noticeLabel.textColor = .black
        noticeLabel.font = .systemFont(ofSize: 15)
        noticeLabel.textAlignment = .left
    }
    
    func configDateUI(_ date: String) {
        dateLabel.text = "\(date) 추첨"
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textAlignment = .right
    }
    
    func configTitleUI() {
        titleLabel.text = "로딩 중..."
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .gray
        titleLabel.textAlignment = .center
    }
    
    func configResultTitleUI(_ drwNo: Int) {
        titleLabel.text = "\(drwNo)회 당첨결과"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = .gray
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        
        if let title = titleLabel.text {
            var attributedStr = NSMutableAttributedString(string: title)
            attributedStr.addAttribute(.foregroundColor, value: UIColor.orange,
                                       range: (title as NSString).range(of: "\(drwNo)회"))
            titleLabel.attributedText = attributedStr
        }
    }
    
    
    func configBallStackUI(_ drwtNoList: [Int]) {
       
        for (idx,view) in ballStackView.arrangedSubviews.enumerated() {
            
            for labelView in view.subviews {
                let label = labelView as! UILabel
                if idx != 6 {
                    var color: UIColor = .clear
                    switch drwtNoList[idx] {
                    case 1...10: color = .yellow
                    case 11...20: color = .blue
                    case 21...30: color = .red
                    case 31...40: color = .gray
                    case 41...45: color = .green
                    default: print("Error")
                    }
                    label.backgroundColor = color // 숫자에 맞춰서 변경
                    label.layer.cornerRadius = 20
                    label.layer.masksToBounds = true
                    label.font = .boldSystemFont(ofSize: 20)
                    label.textColor = .white
                    label.textAlignment = .center
                    label.text = "\(drwtNoList[idx])"
                } else if idx == 6 {
                    label.text = "+"
                    label.textColor = .black
                    label.font = .boldSystemFont(ofSize: 20)
                    label.textAlignment = .center
                }
            }
        }
    }
    
    func configBonusUI() {
        bonusLabel.text = "보너스"
        bonusLabel.textColor = .gray
        bonusLabel.textAlignment = .center
        bonusLabel.font = . boldSystemFont(ofSize: 15)
    }
    
}



