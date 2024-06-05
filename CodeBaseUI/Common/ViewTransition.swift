//
//  ViewTransition.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//
import UIKit



protocol ViewTransition {
   
//   associatedtype data
    
   func pushAfterView<T> (view: UIViewController, data: T?)
    
   func presentAfterView<T> (view: UIViewController, data: T?)
    
    func navigationPresentAfterView<T> (view: UIViewController, data: T?)
    
    func navigationPresentFullAfterView<T> (view: UIViewController, data: T?)
}

@objc protocol ViewReturn {
        
    @objc optional func popBeforeView()
    
    @objc optional func dismissBeforeView()
}

//struct DataRouter<T> {
//    private var bucket: T?
//    var query: T {
//        get {
//            return bucket
//        }
//        set {
//            bucket = newValue
//        }
//    }
//}


// 제네릭, 프로토콜
// some -> Opaque Type, any -> Existential Type
// WWDC
extension UIViewController: ViewTransition {
    
//    typealias data = <#type#>
     
    func pushAfterView<T> (view: UIViewController, data: T?) {
//        if let data {
//            DataRouter<T> = data
//        }
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func presentAfterView<T>(view: UIViewController, data: T?) {
        self.present(view, animated: true)
    }
    
    func navigationPresentAfterView<T>(view: UIViewController, data: T?) {
        let nav = UINavigationController(rootViewController: view)
        present(nav, animated: true)
    }
    
    func navigationPresentFullAfterView<T>(view: UIViewController, data: T?) {
        let nav = UINavigationController(rootViewController: view)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

