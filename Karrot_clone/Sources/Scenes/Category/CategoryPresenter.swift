//
//  CategoryPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit

protocol CategoryPresentationLogic: class {
  
}

final class CategoryPresenter: BasePresenter {
  
  weak var viewController: CategoryDisplayLogic?

}

// MARK: - Present
extension CategoryPresenter: CategoryPresentationLogic {
  
}
