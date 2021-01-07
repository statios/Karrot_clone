//
//  FleaMarketWriteFormViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol FleaMarketWriteFormDisplayLogic: class {

}

final class FleaMarketWriteFormViewController: BaseASViewController {

  @Injected var interactor: FleaMarketWriteFormBusinessLogic
  @Injected var router: (FleaMarketWriteFormRoutingLogic & FleaMarketWriteFormDataPassing)
  
  private let fleaMarketCellKinds = FleaMarketCellKind.allCases
  private let closeButton = UIButton().then {
    $0.setTitle("닫기", for: .normal)
    $0.setTitleColor(.black, for: .normal)
  }
  private lazy var tableNode = ASTableNode().then {
    $0.dataSource = self
    $0.view.isScrollEnabled = false
    $0.view.keyboardDismissMode = .interactive
  }
  
}

// MARK: - Configure
extension FleaMarketWriteFormViewController {
  override func configure() {
    guard let router = router as? FleaMarketWriteFormRouter,
          let interactor = interactor as? FleaMarketWriteFormInteractor,
          let presenter = interactor.presenter as? FleaMarketWriteFormPresenter else { return }
    router.viewController = self
    presenter.viewController = self
  }
}

// MARK: - SetupUI
extension FleaMarketWriteFormViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = closeButton.asBarButtonItem()
    
    closeButton.rx.tap
      .bind { [weak self] in
        self?.dismiss(animated: true)
      }.disposed(by: disposeBag)
  }
}

// MARK: - Layout
extension FleaMarketWriteFormViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .zero,
      child: tableNode
    )
  }
}

// MARK: - Request
extension FleaMarketWriteFormViewController {
  
}

// MARK: - Display
extension FleaMarketWriteFormViewController: FleaMarketWriteFormDisplayLogic {

}

// MARK: -
extension FleaMarketWriteFormViewController: ASTableDataSource {
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return fleaMarketCellKinds.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      guard let `self` = self else { return ASCellNode() }
      return self.fleaMarketCellKinds[indexPath.row].cell
    }
  }
}
