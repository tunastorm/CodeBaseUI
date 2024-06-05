//
//  EmotionViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//

import UIKit
import SnapKit

class EmotionViewController: UIViewController {

    let rectView = UIView()
    let firstRow = UIView()
    let secondRow = UIView()
    let thirdRow = UIView()
    
    
    var itemList: [UIView] = []
    var imageViewList: [UIImageView] = []
    var labelList: [UILabel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        configHierarchy()
        configLayout()
        configUI()
    }
    
    
    func setNavigationBar() {
        self.navigationItem.title = "감정 다이어리"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.tintColor = .black
        
        view.tintColor = .black
        if let backgroundImage = UIImage(named: "scratched paper") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    }
    
    func configHierarchy() {
        for _ in 0...8 {
            let item = UIView()
            let imageView = UIImageView()
            let label = UILabel()
            itemList.append(item)
            imageViewList.append(imageView)
            labelList.append(label)
        }
     
        for i in 0...8 {
            itemList[i].addSubview(imageViewList[i])
            itemList[i].addSubview(labelList[i])
            if i <= 2 {
                firstRow.addSubview(itemList[i])
            } else if i <= 5 {
                secondRow.addSubview(itemList[i])
            } else {
                thirdRow.addSubview(itemList[i])
            }
        }
        
        rectView.addSubview(firstRow)
        rectView.addSubview(secondRow)
        rectView.addSubview(thirdRow)
        view.addSubview(rectView)
    }
    
    func configLayout() {
        rectView.snp.makeConstraints{
            $0.width.equalTo(320)
            $0.height.equalTo(320)
            $0.center.equalTo(view.center)
        }
        
        firstRow.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        secondRow.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(firstRow.snp.bottom).offset(10)
        }
        
        thirdRow.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(secondRow.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
        }
        
        // item index
        // 0, 1, 2
        // 3, 4, 5
        // 6, 7, 8
        itemList[0].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        itemList[1].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(itemList[0].snp.trailing).offset(10)
        }
        itemList[2].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(itemList[1].snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        itemList[3].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        itemList[4].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(itemList[3].snp.trailing).offset(10)
        }
        itemList[5].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(itemList[4].snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        itemList[6].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        itemList[7].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(itemList[6].snp.trailing).offset(10)
        }
        itemList[8].snp.makeConstraints{
            $0.size.equalTo(100)
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalTo(itemList[7].snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        
        for i in 0...itemList.count-1 {
            imageViewList[i].snp.makeConstraints {
                $0.size.equalTo(80)
                $0.top.equalToSuperview()
                $0.horizontalEdges.equalToSuperview().inset(10)
            }
            labelList[i].snp.makeConstraints{
                $0.width.equalTo(100)
                $0.height.equalTo(15)
                $0.top.equalTo(imageViewList[i].snp.bottom).offset(5)
                $0.horizontalEdges.equalToSuperview().inset(10)
                $0.bottom.equalToSuperview()
            }
        }
    }
    
    func configUI() {
//        rectView.backgroundColor = .white
//        firstRow.backgroundColor = .yellow
//        secondRow.backgroundColor = .yellow
//        thirdRow.backgroundColor = .yellow
//        for item in itemList {
//            item.backgroundColor = .purple
//        }
        
        for (idx,imageView) in imageViewList.enumerated() {
//            imageView.backgroundColor = .blue
            imageView.image = UIImage(named: "slime\(idx+1)")
            imageView.contentMode = .scaleAspectFit
        }
        
        let labelText = ["행복해", "사랑해", "좋아해",
                         "당황해", "속상해", "우울해",
                         "심심해", "심란해", "슬퍼"]
        for (idx, label) in labelList.enumerated() {
//            label.layer.backgroundColor = UIColor.red.cgColor
            label.text = labelText[idx]
            label.textAlignment = .center
        }
    }
}
