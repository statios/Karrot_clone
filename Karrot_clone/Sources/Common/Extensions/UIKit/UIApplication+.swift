//
//  UIApplication+.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit

extension UIApplication {
  
  public var visibleViewController: UIViewController? {
    
    guard let rootViewController = UIApplication.shared
            .windows.first(where: { $0.isKeyWindow })?.rootViewController else {
      return nil
    }
    
    return getVisibleViewController(rootViewController)
  }
  
  private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
    
    if let presentedViewController = rootViewController.presentedViewController {
      return getVisibleViewController(presentedViewController)
    }
    
    if let navigationController = rootViewController as? UINavigationController {
      return navigationController.visibleViewController
    }
    
    if let tabBarController = rootViewController as? UITabBarController {
      return tabBarController.selectedViewController
    }
    
    return rootViewController
  }
}
