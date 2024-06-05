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




extension CALayer {

    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {

        for edge in arr_edge {
            
            let border = CALayer()

            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            
            border.backgroundColor = color.cgColor;

            self.addSublayer(border)
        }
    }
}
