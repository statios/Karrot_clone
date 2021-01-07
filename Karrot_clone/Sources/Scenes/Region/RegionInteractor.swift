//
//  RegionInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation
import Resolver

protocol RegionDataStore: class {

}

protocol RegionBusinessLogic: class {

}

final class RegionInteractor: BaseInteractor, RegionDataStore {

//  var worker: RegionWorkerLogic?
  @Injected var presenter: RegionPresentationLogic

}

// MARK: - Business Logic
extension RegionInteractor: RegionBusinessLogic {

}
