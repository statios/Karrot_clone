//
//  RegionRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit
import Resolver

protocol RegionRoutingLogic: class {

}

protocol RegionDataPassing: class {
  var dataStore: RegionDataStore { get set }
}

final class RegionRouter: BaseRouter, RegionDataPassing {

  @Injected var dataStore: RegionDataStore
  weak var viewController: RegionViewController?

}

// MARK: - Route
extension RegionRouter: RegionRoutingLogic {

}

// MARK: - Register
extension RegionRouter: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { RegionInteractor() }
      .implements(RegionDataStore.self)
      .implements(RegionBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { RegionRouter() }
      .implements((RegionRoutingLogic & RegionDataPassing).self)
    Resolver.register { RegionPresenter() }
      .implements(RegionPresentationLogic.self)
  }
}
