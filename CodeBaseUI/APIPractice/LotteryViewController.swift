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
    
    lazy var testNumbers: [Int] = {
        var testList: [Int] = []
        for i in 0...6 {
            testList.append(Int.random(in: 1...45))
        }
        return testList
    }()
    
    lazy var data: [Lotto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLottoData()
        configHierarchy()
        configLayout()
        configUI()
    }
    
    func textFieldShouldReturn(_ sender: UITextField) -> Bool {
        if sender == textField {
            guard let word = textField.text else {
                return true
            }
            textField.resignFirstResponder()
        }
        return true
    }
    
    func getLottoData() {
        
        var drwNo = 1
        repeat {
            let url = APIURL.lottoURL + String(drwNo)
            AF.request(url).responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let value): // value가 Lotto 구조체 형태로 변환됨=
                    if value.returnValue == "fail" {
                        self.view.layoutIfNeeded()
                        break
                    }
                    print("- drwNo: \(drwNo): \(value)")
                    self.data.append(value)
                    drwNo = value.drwNo + 1
                case .failure(let error):
                    print(#function + " 실패!!!\n \(error)")
                    break
                }
            }
        } while(true)

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
        print("data: \(data)")
        if data.isEmpty {
            configTitleUI()
        } else {
            configNoticeUI()
            configDateUI()
            configResultTitleUI()
            configBallStackUI()
            configBonusUI()
        }
    }
    
    func configFilterViewUI() {
        filterView.layer.addBorder([.bottom], color: .lightGray, width: view.frame.width - 20)
    }
    
    func configTextFieldUI() {
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.font = .boldSystemFont(ofSize: 20)
    }
    
    
    func configNoticeUI() {
        noticeLabel.text = "당첨번호 안내"
        noticeLabel.textColor = .black
        noticeLabel.font = .systemFont(ofSize: 15)
        noticeLabel.textAlignment = .left
    }
    
    func configDateUI() {
        let date = "2024-06-05"
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
    
    func configResultTitleUI() {
        if let number = textField.text {
            titleLabel.text = "\(number)회 당첨결과"
            titleLabel.font = .boldSystemFont(ofSize: 20)
            titleLabel.textColor = .gray
            titleLabel.textAlignment = .center
            titleLabel.numberOfLines = 1
            
            if let title = titleLabel.text {
                var attributedStr = NSMutableAttributedString(string: title)
                attributedStr.addAttribute(.foregroundColor, value: UIColor.orange, 
                                           range: (title as NSString).range(of: "\(number)회"))
                titleLabel.attributedText = attributedStr
            }
        }
    }
    
    
    func configBallStackUI() {
        for (idx,view) in ballStackView.arrangedSubviews.enumerated() {
//            if idx % 2 == 0 {
//                label.backgroundColor = .systemMint
//            } else {
//                label.backgroundColor = .purple
//            }
            for labelView in view.subviews {
                let label = labelView as! UILabel
                if idx != 6 {
                    guard let number = testNumbers.popLast() else {return}// API 연동 후 response 값 할당
                    var color: UIColor = .clear
                    switch number {
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
                    label.text = "\(number)"
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



