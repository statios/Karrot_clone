//
//  CategoryWorkerTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/10.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class CategoryWorkerTests: XCTestCase {

  // MARK: Test Double Objects

  final class CategoryWorkerSpy: CategoryWorkerLogic {
    
    func getCategories() -> [ArticleCategory] {
      return Seeds.articleCategories
    }
  }


  // MARK: Properties

  var worker:  CategoryWorkerSpy!
  
  override func setUp() {
    self.worker =  CategoryWorkerSpy()
  }
}


// MARK: - TODO TestName (BDD)

extension CategoryWorkerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}
