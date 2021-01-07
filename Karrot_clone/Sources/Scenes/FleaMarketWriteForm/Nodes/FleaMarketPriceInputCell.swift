//
//  FleaMarketPriceInputCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

final class FleaMarketPriceInputCell: BaseCellNode {
  private let textFieldNode = TextFieldNode().then {
    $0.style.preferredSize.height = 17
  }
  
  override func didLoad() {
    textFieldNode.textField?.placeholder = "가격입력"
    textFieldNode.textField?.keyboardType = .numberPad
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 24, left: 16, bottom: 24, right: 16),
      child: textFieldNode
    )
  }
}

