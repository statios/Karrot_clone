//
//  ASEditableTextNode.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation
import AsyncDisplayKit

extension ASEditableTextNode {
  var numberOfLines: Int {
    return Int((self.textView.contentSize.height / (self.textView.font ?? UIFont()).lineHeight))
  }
}
