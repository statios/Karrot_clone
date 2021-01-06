//
//  FeedRouter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit
import Resolver

protocol FeedRoutingLogic: class {

}

protocol FeedDataPassing: class {
  var dataStore: FeedDataStore { get set }
}

final class FeedRouter: BaseRouter, FeedDataPassing {

  @Injected var dataStore: FeedDataStore
  weak var viewController: FeedViewController?

}

// MARK: - Route
extension FeedRouter: FeedRoutingLogic {

}

// MARK: - Register
extension FeedRouter: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { FeedInteractor() }
      .implements(FeedDataStore.self)
      .implements(FeedBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { FeedRouter() }
      .implements((FeedRoutingLogic & FeedDataPassing).self)
    Resolver.register { FeedPresenter() }
      .implements(FeedPresentationLogic.self)
  }
}
