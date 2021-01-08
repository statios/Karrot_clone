//
//  Scene.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation
import UIKit

enum Scene {
  case empty
  case splash
  case main
  case feed
  case fleaMarketWriteForm
  case category
  case region
}

extension Scene {
  var viewController: UIViewController {
    var viewController: UIViewController
    switch self {
    case .empty:
      viewController = BaseASViewController()
    case .splash:
      viewController = SplashViewController()
    case .main:
      let tabBarController = BaseAsTabBarController()
      let feedViewController = BaseASNavigationController(rootViewController: Scene.feed.viewController)
      tabBarController.setViewControllers([feedViewController], animated: true)
      viewController = tabBarController
    case .feed:
      viewController = FeedViewController()
    case .fleaMarketWriteForm:
      viewController = FleaMarketWriteFormViewController()
    case .category:
      viewController = CategoryViewController()
    case .region:
      viewController = RegionViewController()
    }
    viewController.title = title
    viewController.modalTransitionStyle = transitionStyle
    viewController.modalPresentationStyle = presentationStyle
    return viewController
  }
  
  var title: String? {
    switch self {
    case .feed: return "Feed"
    case .fleaMarketWriteForm: return "중고거래 글쓰기"
    default: return nil
    }
  }
  
  var transitionStyle: UIModalTransitionStyle {
    switch self {
    case .main: return .crossDissolve
    default: return .coverVertical
    }
  }
  
  var presentationStyle: UIModalPresentationStyle {
    switch self {
    case .main: return .fullScreen
    case .fleaMarketWriteForm: return .overFullScreen
    default: return .automatic
    }
  }
}
