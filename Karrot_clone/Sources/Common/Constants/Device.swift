//
//  Device.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit

struct Device {
  static let width = UIScreen.main.bounds.width
  static let height = UIScreen.main.bounds.height
  static let safeAreaInsets = UIApplication.shared
    .windows.first { $0.isKeyWindow }?
    .safeAreaInsets ?? UIEdgeInsets()
  static let navigationHeight = UIApplication.shared
    .visibleViewController?.navigationController?.navigationBar.frame.height ?? 0
  static let topHeight = safeAreaInsets.top + navigationHeight
}
