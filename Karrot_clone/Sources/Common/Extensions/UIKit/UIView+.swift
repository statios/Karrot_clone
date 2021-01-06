//
//  UIView.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import UIKit

extension UIView {
  func asBarButtonItem() -> UIBarButtonItem {
    return UIBarButtonItem(customView: self)
  }
}
