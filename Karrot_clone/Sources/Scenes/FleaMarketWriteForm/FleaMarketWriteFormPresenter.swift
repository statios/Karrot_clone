//
//  FleaMarketWriteFormPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit

protocol FleaMarketWriteFormPresentationLogic: class {
  func presentCategory(response: FleaMarketWriteFormModels.Category.Response)
  func presentCategory(response: FleaMarketWriteFormModels.Category.Response)
}

final class FleaMarketWriteFormPresenter: BasePresenter {
  
  weak var viewController: FleaMarketWriteFormDisplayLogic?

}

// MARK: - Present
extension FleaMarketWriteFormPresenter: FleaMarketWriteFormPresentationLogic {
  func presentCategory(response: FleaMarketWriteFormModels.Category.Response) {
    viewController?.displayCategory(viewModel: .init())
  }
}
