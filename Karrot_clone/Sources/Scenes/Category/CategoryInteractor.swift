//
//  CategoryInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation
import Resolver

protocol CategoryDataStore: class {

}

protocol CategoryBusinessLogic: class {

}

final class CategoryInteractor: BaseInteractor, CategoryDataStore {

//  var worker: CategoryWorkerLogic?
  @Injected var presenter: CategoryPresentationLogic

}

// MARK: - Business Logic
extension CategoryInteractor: CategoryBusinessLogic {

}
