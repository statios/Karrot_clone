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
  func displayFleaMarketWirteForm(viewModel: FeedModels.FleaMarketWriteForm.ViewModel)
}

final class FeedViewController: BaseASViewController {

  @Injected var interactor: FeedBusinessLogic
  @Injected var router: (FeedRoutingLogic & FeedDataPassing)
  
  private let addButtonNode = ASButtonNode().then {
    $0.backgroundColor = .systemOrange
    $0.style.preferredSize = CGSize(width: 56, height: 56)
    $0.cornerRadius = 28
    $0.setTitle("╋", with: .boldSystemFont(ofSize: 24), with: .white, for: .normal)
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
    
    [
      requestFleaMarketWriteForm(trigger: addButtonNode.rx.tap.asObservable())
    ]
    .forEach { $0.disposed(by: disposeBag) }
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
        top: topHeight + 16,
        left: 16,
        bottom: bottomHeight + 16,
        right: 16
      ),
      child: addButtonNodeLayout
    )
  }
}

// MARK: - Request
extension FeedViewController {
  func requestFleaMarketWriteForm(trigger: Observable<Void>) -> Disposable {
    trigger
      .bind { [weak self] in
        self?.interactor.fetchFleaMarketWriteForm(request: .init())
      }
  }
}

// MARK: - Display
extension FeedViewController: FeedDisplayLogic {
  func displayFleaMarketWirteForm(viewModel: FeedModels.FleaMarketWriteForm.ViewModel) {
    router.routeToFleaMarketWriteForm()
  }
}
