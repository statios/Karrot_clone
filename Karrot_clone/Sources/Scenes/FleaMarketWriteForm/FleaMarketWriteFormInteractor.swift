//
//  FleaMarketWriteFormInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import Resolver

protocol FleaMarketWriteFormDataStore: class {

}

protocol FleaMarketWriteFormBusinessLogic: class {

}

final class FleaMarketWriteFormInteractor: BaseInteractor, FleaMarketWriteFormDataStore {

//  var worker: FleaMarketWriteFormWorkerLogic?
  @Injected var presenter: FleaMarketWriteFormPresentationLogic

}

// MARK: - Business Logic
extension FleaMarketWriteFormInteractor: FleaMarketWriteFormBusinessLogic {

}
