//
//  RegionViewControllerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble

@testable import daangna

final class RegionViewControllerTests: XCTestCase {

  // MARK: Test Double Objects

  final class RegionInteractorSpy: RegionBusinessLogic {

    // var somethingCalled: Int = 0
    // func something() { ... }
  }

  final class RegionRouterSpy: RegionRoutingLogic, RegionDataPassing {
    var dataStore: RegionDataStore?

    // var somethingCalled: Int = 0
    // func something() { ... }
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

  func test_doSomething() {
    // given

    // when

    // then
  }
}

