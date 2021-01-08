//
//  RegionPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import UIKit

protocol RegionPresentationLogic: class {
  func presentRegions(response: RegionModels.Regions.Response)
  func presentSelectRegion(response: RegionModels.SelectRegion.Response)
}

final class RegionPresenter: BasePresenter {
  
  weak var viewController: RegionDisplayLogic?

}

// MARK: - Present
extension RegionPresenter: RegionPresentationLogic {
  func presentRegions(response: RegionModels.Regions.Response) {
    viewController?.displayRegions(viewModel: .init(regions: response.result))
  }
  
  func presentSelectRegion(response: RegionModels.SelectRegion.Response) {
    viewController?.displaySelectRegion(viewModel: .init())
  }
}
