//
//  TextFieldNode.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import AsyncDisplayKit
import UIKit

class TextFieldNode: BaseNode {
  
  var textField: UITextField? {
    return view as? UITextField
  }
  
  override init() {
    super.init()
    setViewBlock { UITextField() }
  }
  
}

