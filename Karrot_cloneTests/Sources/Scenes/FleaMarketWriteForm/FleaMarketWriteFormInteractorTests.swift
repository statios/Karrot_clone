//
//  FleaMarketWriteFormInteractorTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/09.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class FleaMarketWriteFormInteractorTests: XCTestCase {

  // MARK: Test Double Objects

  final class FleaMarketWriteFormPresenterSpy: FleaMarketWriteFormPresentationLogic {
    
    var isCalledPresentCategoryScene = false
    var isCalledPresentRegionScene = false
    var isCalledPresentSelectedCategory = false
    
    func presentCategoryScene(response: FleaMarketWriteFormModels.CategoryScene.Response) {
      isCalledPresentCategoryScene = true
    }
    
    func presentRegionScene(response: FleaMarketWriteFormModels.RegionScene.Response) {
      isCalledPresentRegionScene = true
    }
    
    func presentSelectedCategory(response: FleaMarketWriteFormModels.SelectedCategory.Response) {
      isCalledPresentSelectedCategory = true
    }
    
    func presentSelectedRegion(response: FleaMarketWriteFormModels.SelectedRegion.Response) {
      
    }
    
    func presentInputtedPrice(response: FleaMarketWriteFormModels.InputtedPrice.Response) {
      
    }
    
    func presentSubmitArticle(response: FleaMarketWriteFormModels.SubmitArticle.Response) {
      
    }
  }

  // MARK: Properties
  
  var interactor: FleaMarketWriteFormInteractor!
  var presenter: FleaMarketWriteFormPresenterSpy!

  override func setUp() {
    self.interactor = FleaMarketWriteFormInteractor()
    self.presenter = FleaMarketWriteFormPresenterSpy()
    self.interactor.presenter = self.presenter
  }
}


// MARK: - TODO TestName (BDD)

extension FleaMarketWriteFormInteractorTests {

  func test_callingPresentCategoryScene() {
    // given
    let dummyReqeust = FleaMarketWriteFormModels.CategoryScene.Request.init()

    // when
    interactor.fetchCategoryScene(request: dummyReqeust)

    // then
    XCTAssert(presenter.isCalledPresentCategoryScene, "CalledPresentCategoryScene")
  }
  
  func test_callingPresentRegionScene() {
    // given
    let dummyReqeust = FleaMarketWriteFormModels.RegionScene.Request.init()
    
    // when
    interactor.fetchRegionScene(request: dummyReqeust)
    
    // then
    XCTAssert(presenter.isCalledPresentRegionScene, "CalledPresentRegionScene")
  }
  
  func test_callingPresentSelectedCategoryWhenSelectedCategoryIsNotNil() {
    // given
    interactor.selectedArticleCateogy = Seeds.articleCategory
    
    // when
    interactor.fetchSelectedCategory(request: .init())
    
    // then
    XCTAssert(presenter.isCalledPresentSelectedCategory, "CalledPresentSelectedCategory")
  }
  
  func test_notCallingPresentSelectedCategoryWhenSelectedCategoryIsNil() {
    // given
    interactor.selectedArticleCateogy = nil
    
    // when
    interactor.fetchSelectedCategory(request: .init())
    
    // then
    XCTAssert(!presenter.isCalledPresentSelectedCategory, "CalledPresentSelectedCategory")
  }
}
