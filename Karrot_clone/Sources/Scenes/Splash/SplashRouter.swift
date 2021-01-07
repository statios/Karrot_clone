//
//  SplashRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit
import Resolver

protocol SplashRoutingLogic: class {
  func routeToMain()
}

protocol SplashDataPassing: class {
  var dataStore: SplashDataStore { get set }
}

final class SplashRouter: BaseRouter, SplashDataPassing {

  @Injected var dataStore: SplashDataStore
  weak var viewController: SplashViewController?

}

// MARK: - Route
extension SplashRouter: SplashRoutingLogic {
  func routeToMain() {
    present(to: Scene.main.viewController, from: viewController)
  }
}

// MARK: - Register
extension SplashRouter: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { SplashInteractor() }
      .implements(SplashDataStore.self)
      .implements(SplashBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { SplashRouter() }
      .implements((SplashRoutingLogic & SplashDataPassing).self)
    Resolver.register { SplashPresenter() }
      .implements(SplashPresentationLogic.self)
  }
}
