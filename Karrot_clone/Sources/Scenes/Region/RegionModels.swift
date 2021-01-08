//
//  RegionModels.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//
import UIKit

enum RegionModels {

  enum Regions {
    struct Request {}
    struct Response {
      let result: [Region]
    }
    struct ViewModel {
      let regions: [Region]
    }
  }
  
  enum SelectRegion {
    struct Request {
      let indexPath: IndexPath
    }
    struct Response {}
    struct ViewModel {}
  }
}
