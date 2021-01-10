//
//  RegionInteractorTests.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/11.
//

import XCTest
import Nimble

@testable import Karrot_clone

final class RegionInteractorTests: XCTestCase {

  // MARK: Test Double Objects

  final class RegionPresenterSpy: RegionPresentationLogic {
    
    var isCalledPresentRegions = false
    var isCalledPresentSelectRegion = false
    
    func presentRegions(response: RegionModels.Regions.Response) {
      isCalledPresentRegions = true
    }
    
    func presentSelectRegion(response: RegionModels.SelectRegion.Response) {
      isCalledPresentSelectRegion = true
    }
  }

  final class RegionWorkerSpy: RegionWorkerLogic {
    var isCalledGetRegions = false
    
    func getRegions() -> [Region] {
      isCalledGetRegions = true
      return Seeds.regions
    }
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

  func test_callingPresentRegions() {
    // given

    // when
    interactor.fetchRegions(request: .init())

    // then
    XCTAssert(presenter.isCalledPresentRegions)
  }
  
  func test_callingGetRegions() {
    // given

    // when
    interactor.fetchRegions(request: .init())

    // then
    XCTAssert(worker.isCalledGetRegions)
  }
  
  func test_callingPresentSelectRegion() {
    // given
    let indexPath = IndexPath(row: 0, section: 0)
    interactor.fetchRegions(request: .init())
    
    // when
    interactor.fetchSelectedRegion(request: .init(indexPath: indexPath))
    
    // then
    XCTAssert(presenter.isCalledPresentSelectRegion)
  }
}
