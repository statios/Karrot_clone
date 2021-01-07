//
//  FeedPresenter.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import UIKit

protocol FeedPresentationLogic: class {
  func presentFleaMarketWriteForm(response: FeedModels.FleaMarketWriteForm.Response)
}

final class FeedPresenter: BasePresenter {
  
  weak var viewController: FeedDisplayLogic?

}

// MARK: - Present
extension FeedPresenter: FeedPresentationLogic {
  func presentFleaMarketWriteForm(response: FeedModels.FleaMarketWriteForm.Response) {
    viewController?.displayFleaMarketWirteForm(viewModel: .init())
  }
}
