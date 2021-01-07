//
//  FleaMarketRegionSelectionCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

final class FleaMarketSelectionCell: BaseCellNode {

  private let titleTextNode = ASTextNode()
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 24, left: 16, bottom: 24, right: 16),
      child: titleTextNode
    )
  }
  
  override func layout() {
    super.layout()
    
  }
  
  func configure(title: String) {
    titleTextNode.attributedText = NSAttributedString(
      string: title,
      attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
        NSAttributedString.Key.foregroundColor: UIColor.black
      ]
    )
  }
}
