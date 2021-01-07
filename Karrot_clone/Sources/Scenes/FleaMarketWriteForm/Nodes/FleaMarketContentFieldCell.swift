//
//  FleaMarketContentFieldCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

final class FleaMarketContentFieldCell: BaseCellNode {
  
  var canFillHeight = Device.height - 350
  
  private lazy var textViewNode = ASEditableTextNode().then {
    $0.style.preferredSize.height = canFillHeight
    $0.typingAttributes = [
      NSAttributedString.Key.font.rawValue: UIFont.systemFont(ofSize: 17)
    ]
  }
  
  override func didLoad() {
    super.didLoad()
    RxKeyboard.instance.visibleHeight
      .debug()
      .drive(onNext: { [weak self] in
        guard let `self` = self else { return }
        self.textViewNode.style.preferredSize.height = self.canFillHeight - $0
        self.textViewNode.setNeedsLayout()
        self.setNeedsLayout()
      }).disposed(by: disposeBag)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 16, left: 16, bottom: 16, right: 16),
      child: textViewNode
    )
  }
}
