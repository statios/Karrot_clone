//
//  FleaMarketWriteFormInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import Resolver

protocol FleaMarketWriteFormDataStore: class {
  var selectedArticleCateogy: ArticleCategory? { get set }
}

protocol FleaMarketWriteFormBusinessLogic: class {
  func fetchCategoryScene(request: FleaMarketWriteFormModels.CategoryScene.Request)
  func fetchRegionScene(request: FleaMarketWriteFormModels.RegionScene.Request)
  func fetchSelectedCategory(request: FleaMarketWriteFormModels.SelectedCategory.Request)
}

final class FleaMarketWriteFormInteractor: BaseInteractor, FleaMarketWriteFormDataStore {

//  var worker: FleaMarketWriteFormWorkerLogic?
  @Injected var presenter: FleaMarketWriteFormPresentationLogic

  var selectedArticleCateogy: ArticleCategory?
}

// MARK: - Business Logic
extension FleaMarketWriteFormInteractor: FleaMarketWriteFormBusinessLogic {
  func fetchCategoryScene(request: FleaMarketWriteFormModels.CategoryScene.Request) {
    presenter.presentCategoryScene(response: .init())
  }
  
  func fetchRegionScene(request: FleaMarketWriteFormModels.RegionScene.Request) {
    presenter.presentRegionScene(response: .init())
  }
  
  func fetchSelectedCategory(request: FleaMarketWriteFormModels.SelectedCategory.Request) {
    if let category = selectedArticleCateogy {
      presenter.presentSelectedCategory(response: .init(selectedCategory: category))
    }
  }
}
