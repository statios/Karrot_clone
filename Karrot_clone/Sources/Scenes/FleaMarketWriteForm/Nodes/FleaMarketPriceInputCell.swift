//
//  FleaMarketPriceInputCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

protocol FleaMarketPriceInputCellDelegate: class {
  func textChanged(_ text: String?)
}

final class FleaMarketPriceInputCell: BaseCellNode {
  
  var isFreeShare: Bool = false
  weak var delegate: FleaMarketPriceInputCellDelegate?
  
  private let textFieldNode = TextFieldNode().then {
    $0.style.preferredSize.height = 40
    $0.style.preferredSize.width = Device.width - 32
  }
  
  private let separatorNode = ASDisplayNode().then {
    $0.backgroundColor = .lightGray
    $0.style.preferredSize.height = 1
    $0.style.preferredSize.width = Device.width - 32
  }
  
  private lazy var freeShareButtonNode = FreeShareButtonNode()
  
  override func didLoad() {
    super.didLoad()
    textFieldNode.textField?.placeholder = "가격입력"
    textFieldNode.textField?.keyboardType = .numberPad
    
    textFieldNode.textField?.rx.text
      .distinctUntilChanged()
      .bind { [weak self] in
        self?.delegate?.textChanged($0)
      }.disposed(by: disposeBag)
    
    freeShareButtonNode.rx.tap
      .bind { [weak self] in
        self?.textFieldNode.textField?.text = nil
        self?.isFreeShare = false
        self?.textFieldNode.textField?.becomeFirstResponder()
        self?.setNeedsLayout()
      }.disposed(by: disposeBag)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let contentLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: isFreeShare ? freeShareButtonNode : textFieldNode
    )
    
    let separatorLayout = ASInsetLayoutSpec(
      insets: .zero,
      child: separatorNode
    )
    
    let vStack = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 16,
      justifyContent: .start,
      alignItems: .start,
      children: [contentLayout, separatorLayout]
    )
    
    return ASInsetLayoutSpec(
      insets: .init(top: 16, left: 16, bottom: 0, right: 16),
      child: vStack
    )
  }
  
  func configure(_ price: Int) {
    isFreeShare = price == 0
    setNeedsLayout()
  }
}
