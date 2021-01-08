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
  var selectedRegion: Region? { get set }
}

protocol FleaMarketWriteFormBusinessLogic: class {
  func fetchCategoryScene(request: FleaMarketWriteFormModels.CategoryScene.Request)
  func fetchRegionScene(request: FleaMarketWriteFormModels.RegionScene.Request)
  func fetchSelectedCategory(request: FleaMarketWriteFormModels.SelectedCategory.Request)
  func fetchSelectedRegion(request: FleaMarketWriteFormModels.SelectedRegion.Request)
  func fetchInputtedPrice(request: FleaMarketWriteFormModels.InputtedPrice.Request)
  func fetchSubmitArticle(request: FleaMarketWriteFormModels.SubmitArticle.Request)
}

final class FleaMarketWriteFormInteractor: BaseInteractor, FleaMarketWriteFormDataStore {

//  var worker: FleaMarketWriteFormWorkerLogic?
  @Injected var presenter: FleaMarketWriteFormPresentationLogic

  var selectedArticleCateogy: ArticleCategory?
  var selectedRegion: Region?
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
  
  func fetchSelectedRegion(request: FleaMarketWriteFormModels.SelectedRegion.Request) {
    if let region = selectedRegion {
      presenter.presentSelectedRegion(response: .init(selectedRegion: region))
    }
  }
  
  func fetchInputtedPrice(request: FleaMarketWriteFormModels.InputtedPrice.Request) {
    if let priceStr = request.price,
       let priceInt = Int(priceStr) {
      presenter.presentInputtedPrice(response: .init(price: priceInt))
    }
  }
  
  func fetchSubmitArticle(request: FleaMarketWriteFormModels.SubmitArticle.Request) {
    let article = FleaMarketArticle(
      content: request.content,
      price: Int(request.price ?? ""),
      isFreePrice: request.price == "0",
      regionID: selectedRegion?.id,
      categoryID: selectedArticleCateogy?.id
    )
    
    presenter.presentSubmitArticle(
      response: .init(
        fleaMarketArticle: article
      )
    )
  }
}
