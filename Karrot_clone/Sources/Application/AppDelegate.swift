//
//  AppDelegate.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit
import Then

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  -> Bool {
    
    window = UIWindow().then {
      $0.frame = UIScreen.main.bounds
      $0.backgroundColor = .white
      $0.rootViewController = SplashViewController()
      $0.makeKeyAndVisible()
    }
    
    return true
  }
}

