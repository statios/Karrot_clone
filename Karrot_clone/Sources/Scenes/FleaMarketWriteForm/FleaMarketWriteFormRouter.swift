//
//  FleaMarketWriteFormRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit
import Resolver

protocol FleaMarketWriteFormRoutingLogic: class {
  func routeToCategory()
  func routeToRegion()
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
  func routeToCategory() {
    guard let destinationVC = Scene.category.viewController
            as? CategoryViewController else { return }
    var destinationDS = destinationVC.router.dataStore
    
    passDataToCategory(source: dataStore, destination: &destinationDS)
    push(to: destinationVC, from: viewController)
  }
  
  func routeToRegion() {
    guard let destinationVC = Scene.region.viewController
            as? RegionViewController else { return }
    var destinationDS = destinationVC.router.dataStore
    
    passDataToRegion(source: dataStore, destination: &destinationDS)
    push(to: destinationVC, from: viewController)
  }
}

// MARK: - DataPassing
extension FleaMarketWriteFormRouter {
  func passDataToCategory(
    source: FleaMarketWriteFormDataStore,
    destination: inout CategoryDataStore
  ) {
    //pass data here
  }
  
  func passDataToRegion(
    source: FleaMarketWriteFormDataStore,
    destination: inout RegionDataStore
  ) {
    //pass data here
  }
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
