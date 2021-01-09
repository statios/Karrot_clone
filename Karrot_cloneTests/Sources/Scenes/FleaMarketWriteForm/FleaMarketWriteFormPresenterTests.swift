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
    var isCalledDisplaySelectedRegion = false
    var isCalledDisplayInputtedPrice = false
    var isCalledDisplaySubmitArticle = false
    var errorMessageFromSubmittedArticle: String?
    
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
      isCalledDisplaySelectedRegion = true
    }

    func displayInputtedPrice(viewModel: FleaMarketWriteFormModels.InputtedPrice.ViewModel) {
      isCalledDisplayInputtedPrice = true
    }

    func displaySubmitArticle(viewModel: FleaMarketWriteFormModels.SubmitArticle.ViewModel) {
      isCalledDisplaySubmitArticle = true
      errorMessageFromSubmittedArticle = viewModel.errorMessage
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
  
  func test_callingDisplaySelectedRegion() {
    // given
    let dummyRegion = Seeds.region
    
    // when
    presenter.presentSelectedRegion(response: .init(selectedRegion: dummyRegion))
    
    // then
    XCTAssert(display.isCalledDisplaySelectedRegion, "CalledDisplaySelectedRegion")
  }
  
  func test_callingDisplayInputtedPrice() {
    // given
    let dummyPrice = 10000
    
    // when
    presenter.presentInputtedPrice(response: .init(price: dummyPrice))
    
    // then
    XCTAssert(display.isCalledDisplayInputtedPrice)
  }
  
  func test_callingDisplaySubmitArticle() {
    // given
    let dummyArticle = Seeds.fleaMarketArticle
    
    // when
    presenter.presentSubmitArticle(response: .init(fleaMarketArticle: dummyArticle))
    
    // then
    XCTAssert(display.isCalledDisplaySubmitArticle)
  }
  
  func test_errorMessageFromSubmittedArticle() {
    // given
    var articleWithoutCategory = Seeds.fleaMarketArticle
    var articleWithoutRegion = Seeds.fleaMarketArticle
    var articleWithoutPrice = Seeds.fleaMarketArticle
    var articleWithoutContent = Seeds.fleaMarketArticle
    articleWithoutCategory.categoryID = nil
    articleWithoutRegion.regionID = nil
    articleWithoutPrice.price = nil
    articleWithoutContent.content = nil
    let cellKinds = FleaMarketCellKind.allCases
    
    [articleWithoutCategory, articleWithoutRegion, articleWithoutPrice, articleWithoutContent]
      .enumerated()
      .forEach {
        // when
        presenter.presentSubmitArticle(response: .init(fleaMarketArticle: $0.element))
        
        // then
        XCTAssert(display.errorMessageFromSubmittedArticle == cellKinds[$0.offset].errorMessage)
      }
  }
}
