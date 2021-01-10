//
//  CategoryInteractorTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/10.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class CategoryInteractorTests: XCTestCase {

  // MARK: Test Double Objects

  final class CategoryPresenterSpy: CategoryPresentationLogic {
    
    var isCalledPresentArticleCategories = false
    var isCalledPresentSelectCategory = false
    
    func presentArticleCategories(response: CategoryModels.ArticleCategories.Response) {
      isCalledPresentArticleCategories = true
    }
    
    func presentSelectCategory(response: CategoryModels.SelectCategory.Response) {
      isCalledPresentSelectCategory = true
    }
  }

  final class CategoryWorkerSpy: CategoryWorkerLogic {
    
    var isCalledGetCategories = false
    
    func getCategories() -> [ArticleCategory] {
      isCalledGetCategories = true
      return Seeds.articleCategories
    }
  }


  // MARK: Properties
  
  var interactor: CategoryInteractor!
  var presenter: CategoryPresenterSpy!
  var worker: CategoryWorkerSpy!

  override func setUp() {
    self.interactor = CategoryInteractor()
    self.presenter = CategoryPresenterSpy()
    self.worker =  CategoryWorkerSpy()
    self.interactor.presenter = self.presenter
    self.interactor.worker = self.worker
  }
}


// MARK: - TODO TestName (BDD)

extension CategoryInteractorTests {

  func test_callingPresentArticleCategories() {
    // given

    // when
    interactor.fetchArticleCategories(request: .init())

    // then
    XCTAssert(presenter.isCalledPresentArticleCategories)
  }
  
  func test_callingGetCategories() {
    // given

    // when
    interactor.fetchArticleCategories(request: .init())

    // then
    XCTAssert(worker.isCalledGetCategories)
  }
  
  func test_callingPresentSelectCategory() {
    // given
    let indexPath = IndexPath(row: 0, section: 0)
    interactor.fetchArticleCategories(request: .init())
    
    // when
    interactor.fetchSelectCategory(request: .init(indexPath: indexPath))
    
    // then
    XCTAssert(presenter.isCalledPresentSelectCategory)
  }
}
