//
//  RegionInteractor.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation
import Resolver

protocol RegionDataStore: class {
  var regions: [Region] { get set }
  var selectedRegion: Region? { get set }
}

protocol RegionBusinessLogic: class {
  func fetchRegions(request: RegionModels.Regions.Request)
  func fetchSelectedRegion(request: RegionModels.SelectRegion.Request)
}

final class RegionInteractor: BaseInteractor, RegionDataStore {

  @Injected var worker: RegionWorkerLogic
  @Injected var presenter: RegionPresentationLogic

  var regions = [Region]()
  var selectedRegion: Region?
}

// MARK: - Business Logic
extension RegionInteractor: RegionBusinessLogic {
  func fetchRegions(request: RegionModels.Regions.Request) {
    regions = worker.getRegions()
    presenter.presentRegions(response: .init(result: regions))
  }
  
  func fetchSelectedRegion(request: RegionModels.SelectRegion.Request) {
    selectedRegion = regions[request.indexPath.row]
    presenter.presentSelectRegion(response: .init())
  }
}
