//
//  CategoryRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit
import Resolver

protocol CategoryRoutingLogic: class {
  func routeToFleaMarketWriteForm()
}

protocol CategoryDataPassing: class {
  var dataStore: CategoryDataStore { get set }
  func passDataToFleaMarketWriteForm(
    source: CategoryDataStore,
    destination: inout FleaMarketWriteFormDataStore
  )
}

final class CategoryRouter: BaseRouter, CategoryDataPassing {

  @Injected var dataStore: CategoryDataStore
  weak var viewController: CategoryViewController?

}

// MARK: - Route
extension CategoryRouter: CategoryRoutingLogic {
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
extension CategoryRouter {
  func passDataToFleaMarketWriteForm(
    source: CategoryDataStore,
    destination: inout FleaMarketWriteFormDataStore
  ) {
    destination.selectedArticleCateogy = source.selectedArticleCateogy
  }
}

// MARK: - Register
extension CategoryRouter: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { CategoryInteractor() }
      .implements(CategoryDataStore.self)
      .implements(CategoryBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { CategoryRouter() }
      .implements((CategoryRoutingLogic & CategoryDataPassing).self)
    Resolver.register { CategoryPresenter() }
      .implements(CategoryPresentationLogic.self)
    Resolver.register { CategoryWorker() }
      .implements(CategoryWorkerLogic.self)
  }
}
