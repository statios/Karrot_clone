//
//  RegionWorker.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import Foundation

protocol RegionWorkerLogic {
  func getRegions() -> [Region]
}

final class RegionWorker: BaseWorker, RegionWorkerLogic {
  func getRegions() -> [Region] {
    [
      Region(id: 1, regionName: "내동네"),
      Region(id: 2, regionName: "인접동네"),
      Region(id: 3, regionName: "근처동네")
    ]
  }
}
