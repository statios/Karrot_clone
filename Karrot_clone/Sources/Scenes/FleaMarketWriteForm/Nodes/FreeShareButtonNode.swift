//
//  FreeShareButtonNode.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/08.
//

import AsyncDisplayKit

final class FreeShareButtonNode: ASButtonNode {
  private let closeImageNode = ASImageNode().then {
    $0.image = Image.Icon.windowCloseOutline
    $0.style.preferredSize = CGSize(width: 18, height: 18)
  }
  
  private let textNode = ASTextNode().then {
    $0.attributedText = NSAttributedString(
      string: "무료나눔",
      attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
        NSAttributedString.Key.foregroundColor: UIColor.black
      ]
    )
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let hStack = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 0,
      justifyContent: .start,
      alignItems: .center,
      children: [textNode, closeImageNode]
    )
    return ASInsetLayoutSpec(
      insets: .zero,
      child: hStack
    )
  }
}
