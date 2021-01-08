//
//  FleaMarketRegionSelectionCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

final class FleaMarketSelectionCell: SelectionCell {
  private let separatorNode = ASDisplayNode().then {
    $0.backgroundColor = .lightGray
    $0.style.preferredSize.height = 1
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let selectionCellLayout = super.layoutSpecThatFits(constrainedSize)
    
    let separatorLayout = ASInsetLayoutSpec(
      insets: .init(top: 0, left: 16, bottom: 0, right: 16),
      child: separatorNode
    )
    
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [selectionCellLayout, separatorLayout]
    )
  }
}
