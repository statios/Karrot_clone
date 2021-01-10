//
//  RegionViewControllerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble
import Resolver

@testable import Karrot_clone

final class RegionViewControllerTests: XCTestCase {

  // MARK: Test Double Objects

  final class RegionInteractorSpy: RegionBusinessLogic {
    
    var isCalledFetchRegions = false
    var isCalledFetchSelectedRegion = false
    
    func fetchRegions(request: RegionModels.Regions.Request) {
      isCalledFetchRegions = true
    }
    
    func fetchSelectedRegion(request: RegionModels.SelectRegion.Request) {
      isCalledFetchSelectedRegion = true
    }
  }

  final class RegionRouterSpy: RegionRoutingLogic, RegionDataPassing {
    
    @Injected var dataStore: RegionDataStore
    var isCalledRouteToRouteToFleaMarketWriteForm = false
    var isCalledPassDataToFleaMarketWriteForm = false
    
    func routeToFleaMarketWriteForm() {
      isCalledRouteToRouteToFleaMarketWriteForm = true
      
      guard let destinationVC = Scene.fleaMarketWriteForm.viewController
              as? FleaMarketWriteFormViewController else { return }
      var destinationDS = destinationVC.router.dataStore
      
      passDataToFleaMarketWriteForm(
        source: dataStore,
        destination: &destinationDS
      )
    }
    
    func passDataToFleaMarketWriteForm(
      source: RegionDataStore,
      destination: inout FleaMarketWriteFormDataStore
    ) {
      isCalledPassDataToFleaMarketWriteForm = true
    }
  }

  // MARK: Properties

  var viewController: RegionViewController!
  var interactor: RegionInteractorSpy!
  var router: RegionRouterSpy!

  override func setUp() {
    self.viewController = RegionViewController()
    self.interactor = RegionInteractorSpy()
    self.router = RegionRouterSpy()
    self.viewController.interactor = self.interactor
    self.viewController.router = self.router
  }
}


// MARK: - TODO TestName (BDD)

extension RegionViewControllerTests {

  func test_callingFetchArticleCategories() {
    // given
    
    // when
    viewController.viewWillAppear(true)

    // then
    XCTAssert(interactor.isCalledFetchRegions)
  }
  
  func test_callingFetchSelectCategory() {
    // given
    let row = 0
    
    // when
    viewController.tableNode.delegate?.tableNode?(
      viewController.tableNode,
      didSelectRowAt: IndexPath(row: row, section: 0)
    )
    
    // then
    XCTAssert(interactor.isCalledFetchSelectedRegion)
  }
  
  func test_callingRouteToFleaMarketWriteForm() {
    // given
    let viewModel = RegionModels.SelectRegion.ViewModel.init()
    
    // when
    viewController.displaySelectRegion(viewModel: viewModel)
    
    // then
    XCTAssert(router.isCalledRouteToRouteToFleaMarketWriteForm)
    XCTAssert(router.isCalledPassDataToFleaMarketWriteForm)
  }
}

