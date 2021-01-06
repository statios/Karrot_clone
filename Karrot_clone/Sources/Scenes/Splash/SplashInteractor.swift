//
//  SplashInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import Resolver

protocol SplashDataStore: class {

}

protocol SplashBusinessLogic: class {

}

final class SplashInteractor: BaseInteractor, SplashDataStore {

//  var worker: SplashWorkerLogic?
  @Injected var presenter: SplashPresentationLogic

}

// MARK: - Business Logic
extension SplashInteractor: SplashBusinessLogic {

}
