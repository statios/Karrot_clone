//
//  FleaMarketWriteFormViewControllerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/09.
//

import XCTest
import Nimble
import Resolver

@testable import Karrot_clone

final class FleaMarketWriteFormViewControllerTests: XCTestCase {

  // MARK: Test Double Objects

  final class FleaMarketWriteFormInteractorSpy: FleaMarketWriteFormBusinessLogic {

    var isCalledFetchCategoryScene = false
    var isCalledFetchRegionScene = false
    var isCalledFetchSelectedCategory = false
    var isCalledFetchSelectedRegion = false
    
    func fetchCategoryScene(request: FleaMarketWriteFormModels.CategoryScene.Request) {
      isCalledFetchCategoryScene = true
    }

    func fetchRegionScene(request: FleaMarketWriteFormModels.RegionScene.Request) {
      isCalledFetchRegionScene = true
    }

    func fetchSelectedCategory(request: FleaMarketWriteFormModels.SelectedCategory.Request) {
      isCalledFetchSelectedCategory = true
    }

    func fetchSelectedRegion(request: FleaMarketWriteFormModels.SelectedRegion.Request) {
      isCalledFetchSelectedRegion = true
    }

    func fetchInputtedPrice(request: FleaMarketWriteFormModels.InputtedPrice.Request) {

    }

    func fetchSubmitArticle(request: FleaMarketWriteFormModels.SubmitArticle.Request) {

    }
  }

  final class FleaMarketWriteFormRouterSpy: FleaMarketWriteFormRoutingLogic, FleaMarketWriteFormDataPassing {

    var isCalledRouteToCategory = false
    var isCalledPassDataToCategory = false
    var isCalledRouteToRegion = false
    var isCalledPassDataToRegion = false
    
    @Injected var dataStore: FleaMarketWriteFormDataStore

    func passDataToCategory(source: FleaMarketWriteFormDataStore, destination: inout CategoryDataStore) {
      isCalledPassDataToCategory = true
    }

    func passDataToRegion(source: FleaMarketWriteFormDataStore, destination: inout RegionDataStore) {
      isCalledPassDataToRegion = true
    }

    func routeToCategory() {
      guard let destinationVC = Scene.category.viewController
              as? CategoryViewController else { return }
      var destinationDS = destinationVC.router.dataStore
      
      isCalledRouteToCategory = true
      passDataToCategory(source: dataStore, destination: &destinationDS)
    }

    func routeToRegion() {
      guard let destinationVC = Scene.region.viewController
              as? RegionViewController else { return }
      var destinationDS = destinationVC.router.dataStore
      
      isCalledRouteToRegion = true
      passDataToRegion(source: dataStore, destination: &destinationDS)
    }
  }


  // MARK: Properties

  var viewController: FleaMarketWriteFormViewController!
  var interactor: FleaMarketWriteFormInteractorSpy!
  var router: FleaMarketWriteFormRouterSpy!

  override func setUp() {
    self.viewController = FleaMarketWriteFormViewController()
    self.interactor = FleaMarketWriteFormInteractorSpy()
    self.router = FleaMarketWriteFormRouterSpy()
    self.viewController.interactor = self.interactor
    self.viewController.router = self.router
  }
}


// MARK: - TODO TestName (BDD)

extension FleaMarketWriteFormViewControllerTests {

  func test_callingFetchCategoryScene() {
    // given
    let row = viewController.fleaMarketCellKinds
      .enumerated().first { $0.element == .category }?.offset ?? 0
    
    // when
    viewController.tableNode.delegate?.tableNode?(
      viewController.tableNode,
      didSelectRowAt: IndexPath(row: row, section: 0)
    )

    // then - interactor의 fetchCategoryScene()호출
    XCTAssert(interactor.isCalledFetchCategoryScene, "CalledFetchCategoryScene")
  }
  
  func test_callingRouteToCategory() {
    // given
    let dummyViewModel = FleaMarketWriteFormModels.CategoryScene.ViewModel.init()
    
    // when
    viewController.displayCategoryScene(viewModel: dummyViewModel)
    
    // then
    XCTAssert(router.isCalledRouteToCategory, "CalledRouteToCategory")
    XCTAssert(router.isCalledPassDataToCategory, "CalledPassDataToCategory")
  }
  
  func test_callingFetchRegionScene() {
    // given
    let row = viewController.fleaMarketCellKinds
      .enumerated().first { $0.element == .region }?.offset ?? 1
    
    // when
    viewController.tableNode.delegate?.tableNode?(
      viewController.tableNode,
      didSelectRowAt: IndexPath(row: row, section: 0)
    )
    
    // then
    XCTAssert(interactor.isCalledFetchRegionScene, "CalledFetchRegionScene")
  }
  
  func test_callingRouteToRegion() {
    // given
    let dummyViewModel = FleaMarketWriteFormModels.RegionScene.ViewModel.init()
    
    // when
    viewController.displayRegionScene(viewModel: dummyViewModel)
    
    // then
    XCTAssert(router.isCalledRouteToRegion, "CalledRouteToRegion")
    XCTAssert(router.isCalledPassDataToRegion, "CalledPassDataToRegion")
  }
  
  func test_callingFetchSelectedCategory() {
    // given
    
    // when
    viewController.viewWillAppear(true)
    
    // then
    XCTAssert(interactor.isCalledFetchSelectedCategory, "CalledFetchSelectedCategory")
  }
  
  func test_callingFetchSelectedRegion() {
    // given
    
    // when
    viewController.viewWillAppear(true)
    
    // then
    XCTAssert(interactor.isCalledFetchSelectedRegion, "CalledFetchSelectedRegion")
  }
}

