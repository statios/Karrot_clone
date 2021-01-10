//
//  RegionInteractorTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble

@testable import daangna

final class RegionInteractorTests: XCTestCase {

  // MARK: Test Double Objects

  final class RegionPresenterSpy: RegionPresentationLogic {

    // var somethingCalled: Int = 0
    // var somethingStub: Value?
  }

  final class RegionWorkerSpy: RegionWorkerLogic {

    // var somethingCalled: Int = 0
    // var somethingStub: Value?

    // func something() { ... }
  }


  // MARK: Properties
  
  var interactor: RegionInteractor!
  var presenter: RegionPresenterSpy!
  var worker: RegionWorkerSpy!

  override func setUp() {
    self.interactor = RegionInteractor()
    self.presenter = RegionPresenterSpy()
    self.worker =  RegionWorkerSpy()
    self.interactor.presenter = self.presenter
    self.interactor.worker = self.worker
  }
}


// MARK: - TODO TestName (BDD)

extension RegionInteractorTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}
