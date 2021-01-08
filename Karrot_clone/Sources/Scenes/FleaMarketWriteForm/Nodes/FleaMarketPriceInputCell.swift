//
//  FleaMarketPriceInputCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

protocol FleaMarketPriceInputCellDelegate: class {
  func didEndEditing(text: String?)
  func textChanged(_ text: String?)
}

final class FleaMarketPriceInputCell: BaseCellNode {
  
  var isFreeShare: Bool = false
  weak var delegate: FleaMarketPriceInputCellDelegate?
  
  private let textFieldNode = TextFieldNode().then {
    $0.style.preferredSize.height = 40
    $0.backgroundColor = .red
  }
  
  private let separatorNode = ASDisplayNode().then {
    $0.backgroundColor = .lightGray
    $0.style.preferredSize.height = 1
  }
  
  private lazy var freeShareButtonNode = FreeShareButtonNode().then {
    $0.style.preferredSize.height = 40
    $0.backgroundColor = .systemOrange
    $0.cornerRadius = 20
    $0.borderColor = UIColor.systemOrange.cgColor
    $0.borderWidth = 1
  }
  
  override func didLoad() {
    super.didLoad()
    textFieldNode.textField?.placeholder = "가격입력"
    textFieldNode.textField?.keyboardType = .numberPad
    
    textFieldNode.textField?.rx.controlEvent(.editingDidEnd)
      .bind { [weak self] in
        self?.delegate?.didEndEditing(text: self?.textFieldNode.textField?.text)
      }.disposed(by: disposeBag)
    
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
      insets: .init(top: 8, left: 16, bottom: 8, right: 16),
      child: isFreeShare ? freeShareButtonNode : textFieldNode
    )
    
    let separatorLayout = ASInsetLayoutSpec(
      insets: .init(top: 0, left: 16, bottom: 0, right: 16),
      child: separatorNode
    )
    
    return  ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .start,
      children: [contentLayout, separatorLayout]
    )
  }
  
  func configure(_ price: Int) {
    isFreeShare = price == 0
    setNeedsLayout()
  }
}
