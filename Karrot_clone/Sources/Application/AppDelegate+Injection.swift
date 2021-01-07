//
//  AppDelegate+Injection.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    SplashRouter.registerAllServices()
    FeedRouter.registerAllServices()
    FleaMarketWriteFormRouter.registerAllServices()
    CategoryRouter.registerAllServices()
  }
}

