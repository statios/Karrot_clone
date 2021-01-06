//
//  BaseNode.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

class BaseNode: ASDisplayNode {
  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
  }
}

