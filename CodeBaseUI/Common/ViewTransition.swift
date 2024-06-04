//
//  ViewTransition.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/4/24.
//
import UIKit


protocol ViewTransition {
    // 파라미터 data를 Optional Generic으로 선언하여 data를 넘겨주지 않는 경우에도 대응
    func pushAfterView<T> (view: UIViewController, data: T?)
    
    func presentAfterView<T> (view: UIViewController, data: T?)
    
    func navigationPresentAfterView<T> (view: UIViewController, data: T?)
    
    func navigationPresentFullAfterView<T> (view: UIViewController, data: T?)
    
    func popBeforeView()
    
    func dismissBeforeView()
}


//private struct AssociatedKeys {
//    static var data: Element?
//}

extension UIViewController: ViewTransition {
        
    
//    var data: Element? {
//        get {
//            (objc_getAssociatedObject(self, &AssociatedKeys.lastOffsetY) as? MTLStructType?) ??
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.lastOffsetY, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    
    
    func pushAfterView<T>(view: UIViewController, data: T?) {
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
    // 뷰 컨트롤러에서 selector로 가리킬 수 있도록 Object-C 속성의 함수로 선언
    @objc func popBeforeView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissBeforeView() {
        dismiss(animated: true)
    }
}


