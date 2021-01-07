//
//  BaseTableNode.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import AsyncDisplayKit

class BaseTableNode: ASTableNode {
  override func didLoad() {
    super.didLoad()
    view.keyboardDismissMode = .onDrag
  }
}
