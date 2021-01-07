//
//  FleaMarketContentFieldCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

protocol FleaMarketContentFieldCellDelegate: class {
  func chagnedTextViewLineOfNumbers()
}

final class FleaMarketContentFieldCell: BaseCellNode {
  
  weak var delegate: FleaMarketContentFieldCellDelegate?

  var canFillHeight = Device.height - 350
  
  private lazy var textViewNode = ASEditableTextNode().then {
    $0.typingAttributes = [
      NSAttributedString.Key.font.rawValue: UIFont.systemFont(ofSize: 17)
    ]
    $0.backgroundColor = .red
    $0.delegate = self
    $0.attributedPlaceholderText = NSAttributedString(
      string: "방이동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.",
      attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
        NSAttributedString.Key.foregroundColor: UIColor.lightGray
      ]
    )
  }
  
  override func didLoad() {
    super.didLoad()
    textViewNode.textView.translatesAutoresizingMaskIntoConstraints = true
    textViewNode.scrollEnabled = false
    textViewNode.textView.sizeToFit()
    
    textViewNode.textView.rx.text
      .bind { [weak self] _ in
        self?.setNeedsLayout()
      }.disposed(by: disposeBag)
    
    textViewNode.textView.rx.text
      .compactMap { [weak self] _ in self?.textViewNode.numberOfLines }
      .withPrevious(startWith: 1).filter { $0 != $1 }
      .bind { [weak self] (_, _) in
        self?.delegate?.chagnedTextViewLineOfNumbers()
      }.disposed(by: disposeBag)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 16, left: 16, bottom: 16, right: 16),
      child: textViewNode
    )
  }
}

extension FleaMarketContentFieldCell: ASEditableTextNodeDelegate {

}
