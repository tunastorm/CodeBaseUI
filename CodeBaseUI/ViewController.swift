//
//  ViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var buttonList: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonList()
        configHierarchy()
        configLayout()
        configUI()
    }
}

extension ViewController: CodeBaseUI {
    
    func configHierarchy() {
        for button in buttonList {
            view.addSubview(button)
        }
    }
    
    func configLayout() {
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let bottomPadding = window.safeAreaInsets.bottom
        let safeHeight = window.frame.height - topPadding - bottomPadding
        let verticalInset = (safeHeight - 320) * 0.5
        
        buttonList[0].snp.makeConstraints{
            $0.height.equalTo(50)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(verticalInset)
        }
        
        buttonList[1].snp.makeConstraints{
            $0.height.equalTo(50)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.top.equalTo(buttonList[0].snp.bottom).offset(30)
        }
        
        buttonList[2].snp.makeConstraints{
            $0.height.equalTo(50)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.top.equalTo(buttonList[1].snp.bottom).offset(30)
        }
        
        buttonList[3].snp.makeConstraints{
            $0.height.equalTo(50)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.top.equalTo(buttonList[2].snp.bottom).offset(30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(verticalInset)
        }
    }
    
    func configUI() {
        view.backgroundColor = .white
        buttonList[0].setLayoutGoButton(title: "넷플릭스")
        buttonList[1].setLayoutGoButton(title: "감정다이어리")
        buttonList[2].setLayoutGoButton(title: "회차별 로또 당첨번호")
        buttonList[3].setLayoutGoButton(title: "일간 박스오피스")
    }
    
    func setButtonList() {
        let netflixButton = UIButton()
        netflixButton.addTarget(self, action: #selector(pushNetflixView), for: .touchUpInside)
        buttonList.append(netflixButton)
        
        let emotionButton = UIButton()
        emotionButton.addTarget(self, action: #selector(pushEmotionView), for: .touchUpInside)
        buttonList.append(emotionButton)
        
        let lottoButton = UIButton()
        lottoButton.addTarget(self, action: #selector(pushLotteryView), for: .touchUpInside)
        buttonList.append(lottoButton)
        
        let movieButton = UIButton()
        movieButton.addTarget(self, action: #selector(pushBoxOfficeView), for: .touchUpInside)
        buttonList.append(movieButton)
        
//        let testButton = UIButton()
//        testButton.addTarget(self, action: #selector(presentTestView), for: .touchUpInside)
//        buttonList.append(emotionButton)
    }
    
    @objc func pushEmotionView() {
        pushAfterView(view: EmotionViewController(), data: "none")
    }
    
    @objc func pushNetflixView() {
        pushAfterView(view: NetflixViewController(), data: "none")
    }
    @objc func pushLotteryView() {
        pushAfterView(view: LotteryViewController(), data: "none")
    }
    
    @objc func pushBoxOfficeView() {
        pushAfterView(view: BoxOfficeViewController(), data: "none")
    }
    
//    @objc func presentTestView() {
//        presentAfterView(view: TestViewController(), data: Test(testData: "The Test is completed"))
//    }
//
//    struct Test {
//        var testData: String
//    }
}

