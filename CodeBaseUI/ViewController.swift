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
        configConstraints()
        configUI()
    }
    
    func setButtonList() {
        let button = UIButton()
        button.addTarget(self, action: #selector(pushNefilxView), for: .touchUpInside)
        buttonList.append(button)
    }
    
    func configHierarchy() {
        for button in buttonList {
            view.addSubview(button)
        }
    }
    
    func configUI() {
        buttonList[0].setLayoutGoButton(title: "감정다이어리")
    }
    
    func configConstraints() {
        buttonList[0].snp.makeConstraints{
            $0.height.equalTo(50)
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide).inset((view.safeAreaLayoutGuide.layoutFrame.height-50)*0.5)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
    }
    
    @objc func pushNefilxView() {
        print("hihihihi")
        pushAfterView(view: EmotionViewController(), data: "none")
    }

}

