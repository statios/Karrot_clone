//
//  BaseInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import RxSwift

class BaseInteractor {
  var disposeBag = DisposeBag()
  
  init() {
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
    disposeBag = DisposeBag()
  }
}

