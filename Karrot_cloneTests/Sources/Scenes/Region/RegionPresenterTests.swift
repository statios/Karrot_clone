//
//  RegionPresenterTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class RegionPresenterTests: XCTestCase {
  
  // MARK: Test Double Objects
  
  final class RegionDisplaySpy: RegionDisplayLogic {
    var isCalledDisplayRegions = false
    var isCalledDisplaySelectRegion = false
    
    func displayRegions(viewModel: RegionModels.Regions.ViewModel) {
      isCalledDisplayRegions = true
    }
    
    func displaySelectRegion(viewModel: RegionModels.SelectRegion.ViewModel) {
      isCalledDisplaySelectRegion = true
    }
  }
  

  // MARK: Properties
  
  var presenter: RegionPresenter!
  var display: RegionDisplaySpy!
  
  override func setUp() {
    self.presenter = RegionPresenter()
    self.display = RegionDisplaySpy()
    self.presenter.viewController = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension RegionPresenterTests {
  
  func test_callingDisplayRegions() {
    // given
    let regions = Seeds.regions
    
    // when
    presenter.presentRegions(response: .init(result: regions))
    
    // then
    XCTAssert(display.isCalledDisplayRegions)
  }
  
  func test_callingDisplaySelectRegion() {
    // given
    
    // when
    presenter.presentSelectRegion(response: .init())
    
    // then
    XCTAssert(display.isCalledDisplaySelectRegion)
  }
}
