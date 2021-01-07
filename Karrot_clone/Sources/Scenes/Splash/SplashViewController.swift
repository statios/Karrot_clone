//
//  SplashViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol SplashDisplayLogic: class {

}

final class SplashViewController: BaseASViewController {

  @Injected var interactor: SplashBusinessLogic
  @Injected var router: (SplashRoutingLogic & SplashDataPassing)
  
}

// MARK: - Configure
extension SplashViewController {
  override func configure() {
    guard let router = router as? SplashRouter,
          let interactor = interactor as? SplashInteractor,
          let presenter = interactor.presenter as? SplashPresenter else { return }
    router.viewController = self
    presenter.viewController = self
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
      self?.router.routeToMain()
    }
    
  }
}

// MARK: - Layout
extension SplashViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASLayoutSpec()
  }
}

// MARK: - Request
extension SplashViewController {
  
}

// MARK: - Display
extension SplashViewController: SplashDisplayLogic {

}
