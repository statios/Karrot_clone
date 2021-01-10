//
//  CategoryPresenterTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/10.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class CategoryPresenterTests: XCTestCase {
  
  // MARK: Test Double Objects
  
  final class CategoryDisplaySpy: CategoryDisplayLogic {
    
    var isCalledDisplayArticleCategories = false
    var isCalledDisplaySelectCategory = false
    
    func displayArticleCategories(viewModel: CategoryModels.ArticleCategories.ViewModel) {
      isCalledDisplayArticleCategories = true
    }
    
    func displaySelectCategory(viewModel: CategoryModels.SelectCategory.ViewModel) {
      isCalledDisplaySelectCategory = true
    }
  }
  

  // MARK: Properties
  
  var presenter: CategoryPresenter!
  var display: CategoryDisplaySpy!
  
  override func setUp() {
    self.presenter = CategoryPresenter()
    self.display = CategoryDisplaySpy()
    self.presenter.viewController = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension CategoryPresenterTests {
  
  func test_callingDisplayArticleCategories() {
    // given
    let articleCategories = Seeds.articleCategories
    
    // when
    presenter.presentArticleCategories(response: .init(result: articleCategories))
    
    // then
    XCTAssert(display.isCalledDisplayArticleCategories)
  }
  
  func test_callingDisplaySelectCategory() {
    // given
    
    // when
    presenter.presentSelectCategory(response: .init())
    
    // then
    XCTAssert(display.isCalledDisplaySelectCategory)
  }
}
