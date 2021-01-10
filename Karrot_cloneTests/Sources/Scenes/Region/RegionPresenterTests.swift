//
//  RegionPresenterTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble

@testable import daangna

final class RegionPresenterTests: XCTestCase {
  
  // MARK: Test Double Objects
  
  final class RegionDisplaySpy: RegionDisplayLogic {
    
    // var somethingOutput: ViewModel? 
  }
  

  // MARK: Properties
  
  var presenter: RegionPresenter!
  var display: RegionDisplaySpy!
  
  override func setUp() {
    self.presenter = RegionPresenter()
    self.display = RegionDisplaySpy()
    self.presenter.view = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension RegionPresenterTests {
  
  func test_doSomething() {
    // given
    
    // when
    
    // then
  }
}
