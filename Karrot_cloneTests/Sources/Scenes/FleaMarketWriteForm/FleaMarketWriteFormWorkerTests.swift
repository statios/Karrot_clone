//
//  FleaMarketWriteFormWorkerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/09.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class FleaMarketWriteFormWorkerTests: XCTestCase {

  // MARK: Test Double Objects

  final class FleaMarketWriteFormWorkerSpy: FleaMarketWriteFormWorkerLogic {

    // var somethingCalled: Int = 0
    // var somethingStub: Value?

    // func something() { ... }
  }


  // MARK: Properties

  var worker:  FleaMarketWriteFormWorkerSpy!
  
  override func setUp() {
    self.worker =  FleaMarketWriteFormWorkerSpy()
  }
}


// MARK: - TODO TestName (BDD)

extension FleaMarketWriteFormWorkerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}
