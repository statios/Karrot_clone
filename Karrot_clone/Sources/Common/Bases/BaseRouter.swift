//
//  BaseRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import UIKit

class BaseRouter {
  init() {
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
  func pop(from target: UIViewController?,
           animated: Bool = true) {
    target?.navigationController?.popViewController(animated: animated)
  }
  
  func push(to: UIViewController,
            from target: UIViewController?,
            animated: Bool = true) {
    target?.navigationController?.pushViewController(to, animated: animated)
  }
  
  func present(to: UIViewController,
               from target: UIViewController?,
               animated: Bool = true,
               completion: (() -> Void)? = nil) {
    target?.present(to, animated: animated, completion: completion)
  }
  
  func dismiss(from target: UIViewController?,
               animated: Bool = true,
               completion: (() -> Void)? = nil) {
    target?.dismiss(animated: animated, completion: completion)
  }
}

