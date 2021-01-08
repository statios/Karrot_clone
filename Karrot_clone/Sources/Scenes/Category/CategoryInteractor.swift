//
//  CategoryInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation
import Resolver

protocol CategoryDataStore: class {
  var articleCategories: [ArticleCategory] { get set }
  var selectedArticleCateogy: ArticleCategory? { get set }
}

protocol CategoryBusinessLogic: class {
  func fetchArticleCategories(request: CategoryModels.ArticleCategories.Request)
  func fetchSelectCategory(request: CategoryModels.SelectCategory.Request)
}

final class CategoryInteractor: BaseInteractor, CategoryDataStore {

  @Injected var worker: CategoryWorkerLogic
  @Injected var presenter: CategoryPresentationLogic
  
  var articleCategories = [ArticleCategory]()
  var selectedArticleCateogy: ArticleCategory?

}

// MARK: - Business Logic
extension CategoryInteractor: CategoryBusinessLogic {
  func fetchArticleCategories(request: CategoryModels.ArticleCategories.Request) {
    articleCategories = worker.getCategories()
    presenter.presentArticleCategories(response: .init(result: articleCategories))
  }
  
  func fetchSelectCategory(request: CategoryModels.SelectCategory.Request) {
    selectedArticleCateogy = articleCategories[request.indexPath.row]
    presenter.presentSelectCategory(response: .init())
  }
}
