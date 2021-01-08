//
//  FleaMarketContentFieldCell.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit

protocol FleaMarketContentFieldCellDelegate: class {
  func chagnedTextViewLineOfNumbers()
  func textChanged(_ textView: UITextView, _ text: String?)
}

final class FleaMarketContentFieldCell: BaseCellNode {
  
  weak var delegate: FleaMarketContentFieldCellDelegate?

  var canFillHeight = Device.height - 350
  
  private lazy var textViewNode = ASEditableTextNode().then {
    $0.typingAttributes = [
      NSAttributedString.Key.font.rawValue: UIFont.systemFont(ofSize: 17)
    ]
    $0.delegate = self
    $0.attributedPlaceholderText = NSAttributedString(
      string: "내용을 입력하세요.\n\n\n\n\n",
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
      .compactMap { [weak self] _ in self?.textViewNode.numberOfLines }
      .withPrevious(startWith: 1).filter { $0 != $1 }
      .bind { [weak self] (_, _) in
        self?.setNeedsLayout()
        self?.delegate?.chagnedTextViewLineOfNumbers()
      }.disposed(by: disposeBag)
    
    textViewNode.textView.rx.text
      .bind { [weak self] in
        guard let `self` = self else { return }
        self.delegate?.textChanged(self.textViewNode.textView, $0)
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
