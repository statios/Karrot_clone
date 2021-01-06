//
//  FleaMarketWriteFormRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit
import Resolver

protocol FleaMarketWriteFormRoutingLogic: class {

}

protocol FleaMarketWriteFormDataPassing: class {
  var dataStore: FleaMarketWriteFormDataStore { get set }
}

final class FleaMarketWriteFormRouter: BaseRouter, FleaMarketWriteFormDataPassing {

  @Injected var dataStore: FleaMarketWriteFormDataStore
  weak var viewController: FleaMarketWriteFormViewController?

}

// MARK: - Route
extension FleaMarketWriteFormRouter: FleaMarketWriteFormRoutingLogic {

}

// MARK: - Register
extension FleaMarketWriteFormRouter: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { FleaMarketWriteFormInteractor() }
      .implements(FleaMarketWriteFormDataStore.self)
      .implements(FleaMarketWriteFormBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { FleaMarketWriteFormRouter() }
      .implements((FleaMarketWriteFormRoutingLogic & FleaMarketWriteFormDataPassing).self)
    Resolver.register { FleaMarketWriteFormPresenter() }
      .implements(FleaMarketWriteFormPresentationLogic.self)
  }
}
