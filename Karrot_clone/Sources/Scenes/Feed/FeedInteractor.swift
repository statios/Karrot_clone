//
//  FeedInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import Resolver

protocol FeedDataStore: class {

}

protocol FeedBusinessLogic: class {

}

final class FeedInteractor: BaseInteractor, FeedDataStore {

//  var worker: FeedWorkerLogic?
  @Injected var presenter: FeedPresentationLogic

}

// MARK: - Business Logic
extension FeedInteractor: FeedBusinessLogic {

}
