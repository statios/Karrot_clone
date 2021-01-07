//
//  CategoryRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit
import Resolver

protocol CategoryRoutingLogic: class {

}

protocol CategoryDataPassing: class {
  var dataStore: CategoryDataStore { get set }
}

final class CategoryRouter: BaseRouter, CategoryDataPassing {

  @Injected var dataStore: CategoryDataStore
  weak var viewController: CategoryViewController?

}

// MARK: - Route
extension CategoryRouter: CategoryRoutingLogic {

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
  }
}
