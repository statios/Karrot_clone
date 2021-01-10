//
//  CategoryViewControllerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/10.
//

import XCTest
import Nimble
import Resolver

@testable import Karrot_clone

final class CategoryViewControllerTests: XCTestCase {

  // MARK: Test Double Objects

  final class CategoryInteractorSpy: CategoryBusinessLogic {
    var isCalledFetchArticleCategories = false
    var isCalledFetchSelectCategory = false
    
    func fetchArticleCategories(request: CategoryModels.ArticleCategories.Request) {
      isCalledFetchArticleCategories = true
    }
    
    func fetchSelectCategory(request: CategoryModels.SelectCategory.Request) {
      isCalledFetchSelectCategory = true
    }
  }

  final class CategoryRouterSpy: CategoryRoutingLogic, CategoryDataPassing {
    @Injected var dataStore: CategoryDataStore
    weak var viewController: CategoryViewController?
    
    var isCalledRouteToFleaMarketWriteForm = false
    var isCalledPassDataToFleaMarketWriteForm = false
    
    func routeToFleaMarketWriteForm() {
      isCalledRouteToFleaMarketWriteForm = true
      
      guard let destinationVC = Scene.fleaMarketWriteForm.viewController
              as? FleaMarketWriteFormViewController else { return }
      var destinationDS = destinationVC.router.dataStore
      
      passDataToFleaMarketWriteForm(
        source: dataStore,
        destination: &destinationDS
      )
    }
    
    func passDataToFleaMarketWriteForm(
      source: CategoryDataStore,
      destination: inout FleaMarketWriteFormDataStore
    ) {
      isCalledPassDataToFleaMarketWriteForm = true
    }
  }


  // MARK: Properties

  var viewController: CategoryViewController!
  var interactor: CategoryInteractorSpy!
  var router: CategoryRouterSpy!

  override func setUp() {
    self.viewController = CategoryViewController()
    self.interactor = CategoryInteractorSpy()
    self.router = CategoryRouterSpy()
    self.viewController.interactor = self.interactor
    self.viewController.router = self.router
    self.router.viewController = viewController
  }
}


// MARK: - TODO TestName (BDD)

extension CategoryViewControllerTests {

  func test_callingFetchArticleCategories() {
    // given
    
    // when
    viewController.viewWillAppear(true)

    // then
    XCTAssert(interactor.isCalledFetchArticleCategories)
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
    XCTAssert(interactor.isCalledFetchSelectCategory)
  }
  
  func test_callingRouteToFleaMarketWriteForm() {
    // given
    let viewModel = CategoryModels.SelectCategory.ViewModel.init()
    
    // when
    viewController.displaySelectCategory(viewModel: viewModel)
    
    // then
    XCTAssert(router.isCalledRouteToFleaMarketWriteForm)
    XCTAssert(router.isCalledPassDataToFleaMarketWriteForm)
  }
}

