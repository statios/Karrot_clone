//
//  CategoryViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol CategoryDisplayLogic: class {

}

final class CategoryViewController: BaseASViewController {

  @Injected var interactor: CategoryBusinessLogic
  @Injected var router: (CategoryRoutingLogic & CategoryDataPassing)
  
}

// MARK: - Configure
extension CategoryViewController {
  override func configure() {
    guard let router = router as? CategoryRouter,
          let interactor = interactor as? CategoryInteractor,
          let presenter = interactor.presenter as? CategoryPresenter else { return }
    router.viewController = self
    presenter.viewController = self
  }
}

// MARK: - Layout
extension CategoryViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASLayoutSpec()
  }
}

// MARK: - Request
extension CategoryViewController {
  
}

// MARK: - Display
extension CategoryViewController: CategoryDisplayLogic {

}
