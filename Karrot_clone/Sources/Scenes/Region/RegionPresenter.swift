//
//  RegionPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit

protocol RegionPresentationLogic: class {
  
}

final class RegionPresenter: BasePresenter {
  
  weak var viewController: RegionDisplayLogic?

}

// MARK: - Present
extension RegionPresenter: RegionPresentationLogic {
  
}
