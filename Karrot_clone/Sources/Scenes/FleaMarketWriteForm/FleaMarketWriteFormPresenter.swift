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
  func presentSelectedRegion(response: FleaMarketWriteFormModels.SelectedRegion.Response)
  func presentInputtedPrice(response: FleaMarketWriteFormModels.InputtedPrice.Response)
  func presentSubmitArticle(response: FleaMarketWriteFormModels.SubmitArticle.Response)
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
  
  func presentSelectedRegion(response: FleaMarketWriteFormModels.SelectedRegion.Response) {
    viewController?.displaySelectedRegion(
      viewModel: .init(
        regionName: response.selectedRegion.regionName
      )
    )
  }
  
  func presentInputtedPrice(response: FleaMarketWriteFormModels.InputtedPrice.Response) {
    viewController?.displayInputtedPrice(viewModel: .init(price: response.price))
  }
  
  func presentSubmitArticle(response: FleaMarketWriteFormModels.SubmitArticle.Response) {
    var errorMessages: [String] = []
    
    if response.fleaMarketArticle.categoryID == nil {
      errorMessages.append("- 카테고리를 선택해주세요.")
    }
    
    if response.fleaMarketArticle.regionID == nil {
      errorMessages.append("- 동네를 선택해주세요.")
    }
    
    if response.fleaMarketArticle.content?.isEmpty ?? true {
      errorMessages.append("- 내용을 입력해주세요.")
    }
    
    let message: String? = errorMessages.isEmpty ? nil : errorMessages.joined(separator: "\n")
    let isSuccess = message == nil
    let title = isSuccess ? "성공" : "실패"
    
    viewController?.displaySubmitArticle(
      viewModel: .init(
        isSuccess: isSuccess,
        title: title,
        errorMessage: message
      )
    )
  }
}
