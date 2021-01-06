//
//  FleaMarketContentFieldCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

final class FleaMarketContentFieldCell: BaseCellNode {
  private let titleTextNode = ASTextNode().then {
    $0.attributedText = NSAttributedString(string: "title")
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 0),
      child: titleTextNode
    )
  }
}
