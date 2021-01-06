//
//  FeedViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol FeedDisplayLogic: class {

}

final class FeedViewController: BaseASViewController {

  @Injected var interactor: FeedBusinessLogic
  @Injected var router: (FeedRoutingLogic & FeedDataPassing)
  
  private let addButtonNode = ASButtonNode().then {
    $0.backgroundColor = .red
    $0.style.preferredSize = CGSize(width: 56, height: 56)
    $0.cornerRadius = 28
  }
  
}

// MARK: - Configure
extension FeedViewController {
  override func configure() {
    guard let router = router as? FeedRouter,
          let interactor = interactor as? FeedInteractor,
          let presenter = interactor.presenter as? FeedPresenter else { return }
    router.viewController = self
    presenter.viewController = self
    
    addButtonNode.rx.tap
      .bind { [weak self] in
        let viewController = FleaMarketWriteFormViewController()
        let navigationController = BaseASNavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .overFullScreen
        viewController.title = "중고거래 글쓰기"
        self?.present(navigationController, animated: true)
      }.disposed(by: disposeBag)
  }
}

// MARK: - Layout
extension FeedViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    let addButtonNodeLayout = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .end,
      alignItems: .end,
      children: [addButtonNode]
    )
    
    return ASInsetLayoutSpec(
      insets: .init(
        top: topHeight + 8,
        left: 8,
        bottom: bottomHeight + 8,
        right: 8
      ),
      child: addButtonNodeLayout
    )
  }
}

// MARK: - Request
extension FeedViewController {
  
}

// MARK: - Display
extension FeedViewController: FeedDisplayLogic {

}
