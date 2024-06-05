//
//  MainUIButton+Extension.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//

import UIKit


// StoryBoard객체는 같은 스토리보드 파일안에 있는 뷰 컨트롤러로 전환할 때는 생성안해도 됨
//let sb = UIStoryboard(name: "Home", bundle: nil)
//let identifier = DetailViewController.identifier
//let vc = sb.instantiateViewController(withIdentifier: identifier) as! DetailViewController
//// vc.contents = "테스트"
//// 값 전달 시 아웃렛을 활용할 수가 없음!
//vc.data = list[indexPath.row]
//vc.contents["title"] = list[indexPath.row].title
//vc.contents["description"] = list[indexPath.row].description
//navigationController?.pushViewController(vc, animated: true)


extension UIButton {
    func setLayoutGoButton(title: String) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .boldSystemFont(ofSize: 15)
        self.backgroundColor = .systemMint
    }
}


extension UIImageView {
    func setCornerRadius() {
        self.layer.cornerRadius = self.frame.height * 0.1
        self.layer.masksToBounds = true
    }
}




