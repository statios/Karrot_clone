//
//  FleaMarketWriteFormPresenterTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/09.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class FleaMarketWriteFormPresenterTests: XCTestCase {

  // MARK: Test Double Objects

  final class FleaMarketWriteFormDisplaySpy: FleaMarketWriteFormDisplayLogic {
    
    var isCalledDisplayCategoryScene = false
    var isCalledDisplayRegionScene = false
    var isCalledDisplaySelectedCategory = false
    
    func displayCategoryScene(viewModel: FleaMarketWriteFormModels.CategoryScene.ViewModel) {
      isCalledDisplayCategoryScene = true
    }

    func displayRegionScene(viewModel: FleaMarketWriteFormModels.RegionScene.ViewModel) {
      isCalledDisplayRegionScene = true
    }

    func displaySelectedCategory(viewModel: FleaMarketWriteFormModels.SelectedCategory.ViewModel) {
      isCalledDisplaySelectedCategory = true
    }

    func displaySelectedRegion(viewModel: FleaMarketWriteFormModels.SelectedRegion.ViewModel) {
      
    }

    func displayInputtedPrice(viewModel: FleaMarketWriteFormModels.InputtedPrice.ViewModel) {
      
    }

    func displaySubmitArticle(viewModel: FleaMarketWriteFormModels.SubmitArticle.ViewModel) {
      
    }
  }


  // MARK: Properties

  var presenter: FleaMarketWriteFormPresenter!
  var display: FleaMarketWriteFormDisplaySpy!

  override func setUp() {
    self.presenter = FleaMarketWriteFormPresenter()
    self.display = FleaMarketWriteFormDisplaySpy()
    self.presenter.viewController = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension FleaMarketWriteFormPresenterTests {

  func test_callingDisplayCategoryScene() {
    // given
    let dummyResponse = FleaMarketWriteFormModels.CategoryScene.Response.init()

    // when
    presenter.presentCategoryScene(response: dummyResponse)

    // then
    XCTAssert(display.isCalledDisplayCategoryScene, "CalledDisplayCategoryScene")
  }
  
  func test_callingDisplayRegionScene() {
    // given
    let dummyResponse = FleaMarketWriteFormModels.RegionScene.Response.init()
    
    // when
    presenter.presentRegionScene(response: dummyResponse)
    
    // then
    XCTAssert(display.isCalledDisplayRegionScene, "CalledDisplayRegionScene")
  }
  
  func test_callingDisplaySelectedCategory() {
    // given
    let dummyCategory = Seeds.articleCategory
    
    // when
    presenter.presentSelectedCategory(response: .init(selectedCategory: dummyCategory))
    
    // then
    XCTAssert(display.isCalledDisplaySelectedCategory, "CalledDisplaySelectedCategory")
  }
}
