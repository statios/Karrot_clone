//
//  SplashPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit

protocol SplashPresentationLogic: class {
  
}

final class SplashPresenter: BasePresenter {
  
  weak var viewController: SplashDisplayLogic?

}

// MARK: - Present
extension SplashPresenter: SplashPresentationLogic {
  
}
