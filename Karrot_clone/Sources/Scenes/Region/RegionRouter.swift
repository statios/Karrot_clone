//
//  RegionRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit
import Resolver

protocol RegionRoutingLogic: class {
  func routeToFleaMarketWriteForm()
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
  func routeToFleaMarketWriteForm() {
    guard let destinationVC = viewController?
            .navigationController?
            .viewControllers
            .first(where: { $0.isKind(of: FleaMarketWriteFormViewController.self) })
            as? FleaMarketWriteFormViewController else { return }
    var destinationDS = destinationVC.router.dataStore
    
    passDataToFleaMarketWriteForm(source: dataStore, destination: &destinationDS)
    pop(from: viewController)
  }
}

// MARK: - DataPassing
extension RegionRouter {
  func passDataToFleaMarketWriteForm(
    source: RegionDataStore,
    destination: inout FleaMarketWriteFormDataStore
  ) {
    destination.selectedRegion = source.selectedRegion
  }
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
    Resolver.register { RegionWorker() }
      .implements(RegionWorkerLogic.self)
  }
}
