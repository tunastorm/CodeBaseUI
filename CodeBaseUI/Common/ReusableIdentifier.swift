//
//  ReusableIdentifier.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//

import UIKit

protocol ReuseIdentifierProtocol {
    static var identifier: String { get }
}


extension UIViewController: ReuseIdentifierProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }

}

extension UITableViewCell: ReuseIdentifierProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }

}
