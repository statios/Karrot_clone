//
//  RegionWorkerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble

@testable import daangna

final class RegionWorkerTests: XCTestCase {

  // MARK: Test Double Objects

  final class RegionWorkerSpy: RegionWorkerLogic {

    // var somethingCalled: Int = 0
    // var somethingStub: Value?

    // func something() { ... }
  }


  // MARK: Properties

  var worker:  RegionWorkerSpy!
  
  override func setUp() {
    self.worker =  RegionWorkerSpy()
  }
}


// MARK: - TODO TestName (BDD)

extension RegionWorkerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}
