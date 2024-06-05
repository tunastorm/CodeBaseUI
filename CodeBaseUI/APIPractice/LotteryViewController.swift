//
//  LotteryViewController.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import UIKit

class LotteryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
        configNavigationBar()
        configHierarchy()
        configLayout()
        configUI()
    }
}

extension LotteryViewController: CodeBaseUI {
    func configHierarchy() {
        
    }
    
    func configLayout() {
     
    }
    
    func configUI() {
        navigationItem.title = "로또"
        view.backgroundColor = .white
    }
    
    func configNavigationBar() {
        
    }
    
    func setButtons() {

    }
}



