//
//  TestViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        view.addSubview(label)
        
        label.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    

}
