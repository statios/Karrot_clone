//
//  CategoryPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit

protocol CategoryPresentationLogic: class {
  func presentArticleCategories(response: CategoryModels.ArticleCategories.Response)
  func presentSelectCategory(response: CategoryModels.SelectCategory.Response)
}

final class CategoryPresenter: BasePresenter {
  
  weak var viewController: CategoryDisplayLogic?

}

// MARK: - Present
extension CategoryPresenter: CategoryPresentationLogic {
  func presentArticleCategories(response: CategoryModels.ArticleCategories.Response) {
    viewController?.displayArticleCategories(viewModel: .init(articleCategories: response.result))
  }
  
  func presentSelectCategory(response: CategoryModels.SelectCategory.Response) {
    viewController?.displaySelectCategory(viewModel: .init())
  }
}
