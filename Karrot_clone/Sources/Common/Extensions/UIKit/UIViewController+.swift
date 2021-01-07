//
//  UIViewController+.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import UIKit

extension UIViewController {
  
  var bottomHeight: CGFloat {
    let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0
    return tabBarHeight// + bottomSafeAreaHeight
  }
  
  var topHeight: CGFloat {
    let topSafeAreaHeight = UIApplication.shared
      .windows.first { $0.isKeyWindow }?
      .safeAreaInsets.top ?? 0
    let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
    return topSafeAreaHeight + navigationBarHeight
  }
  
  func showAlert(title: String? = nil,
                 message: String? = nil,
                 button: String? = "확인",
                 handler: ((UIAlertAction) -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: button, style: .default, handler: handler)
    alertController.addAction(alertAction)
    present(alertController, animated: true)
  }
  
  func withNavi() -> UIViewController {
    let navigationController = BaseASNavigationController(rootViewController: self)
    navigationController.modalPresentationStyle = self.modalPresentationStyle
    navigationController.modalTransitionStyle = self.modalTransitionStyle
    return navigationController
  }
}

