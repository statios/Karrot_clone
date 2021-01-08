//
//  FleaMarketWriteFormPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit

protocol FleaMarketWriteFormPresentationLogic: class {
  func presentCategoryScene(response: FleaMarketWriteFormModels.CategoryScene.Response)
  func presentRegionScene(response: FleaMarketWriteFormModels.RegionScene.Response)
  func presentSelectedCategory(response: FleaMarketWriteFormModels.SelectedCategory.Response)
}

final class FleaMarketWriteFormPresenter: BasePresenter {
  
  weak var viewController: FleaMarketWriteFormDisplayLogic?

}

// MARK: - Present
extension FleaMarketWriteFormPresenter: FleaMarketWriteFormPresentationLogic {
  func presentCategoryScene(response: FleaMarketWriteFormModels.CategoryScene.Response) {
    viewController?.displayCategoryScene(viewModel: .init())
  }
  
  func presentRegionScene(response: FleaMarketWriteFormModels.RegionScene.Response) {
    viewController?.displayRegionScene(viewModel: .init())
  }
  
  func presentSelectedCategory(response: FleaMarketWriteFormModels.SelectedCategory.Response) {
    viewController?.displaySelectedCategory(
      viewModel: .init(
        categoryName: response.selectedCategory.categoryName
      )
    )
  }
}
