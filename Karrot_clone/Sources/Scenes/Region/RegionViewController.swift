//
//  RegionViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol RegionDisplayLogic: class {

}

final class RegionViewController: BaseASViewController {

  @Injected var interactor: RegionBusinessLogic
  @Injected var router: (RegionRoutingLogic & RegionDataPassing)
  
}

// MARK: - Configure
extension RegionViewController {
  override func configure() {
    guard let router = router as? RegionRouter,
          let interactor = interactor as? RegionInteractor,
          let presenter = interactor.presenter as? RegionPresenter else { return }
    router.viewController = self
    presenter.viewController = self
  }
}

// MARK: - Layout
extension RegionViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASLayoutSpec()
  }
}

// MARK: - Request
extension RegionViewController {
  
}

// MARK: - Display
extension RegionViewController: RegionDisplayLogic {

}
