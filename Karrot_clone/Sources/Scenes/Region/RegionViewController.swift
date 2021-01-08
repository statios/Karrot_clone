//
//  RegionViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol RegionDisplayLogic: class {
  func displayRegions(viewModel: RegionModels.Regions.ViewModel)
  func displaySelectRegion(viewModel: RegionModels.SelectRegion.ViewModel)
}

final class RegionViewController: BaseASViewController {

  @Injected var interactor: RegionBusinessLogic
  @Injected var router: (RegionRoutingLogic & RegionDataPassing)
  
  private var regions = [Region]()
  
  private lazy var tableNode = ASTableNode().then {
    $0.dataSource = self
    $0.delegate = self
  }
}

// MARK: - Configure
extension RegionViewController {
  override func configure() {
    guard let router = router as? RegionRouter,
          let interactor = interactor as? RegionInteractor,
          let presenter = interactor.presenter as? RegionPresenter else { return }
    router.viewController = self
    presenter.viewController = self
    
    [
      requestRegions(trigger: rx.viewWillAppear.asObservableVoid().take(1))
    ]
    .forEach { $0.disposed(by: disposeBag) }
  }
}

// MARK: - Layout
extension RegionViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .zero,
      child: tableNode
    )
  }
}

// MARK: - Request
extension RegionViewController {
  func requestRegions(trigger: Observable<Void>) -> Disposable {
    trigger
      .bind { [weak self] in
        self?.interactor.fetchRegions(request: .init())
      }
  }
}

// MARK: - Display
extension RegionViewController: RegionDisplayLogic {
  func displayRegions(viewModel: RegionModels.Regions.ViewModel) {
    regions = viewModel.regions
    tableNode.reloadData()
  }
  
  func displaySelectRegion(viewModel: RegionModels.SelectRegion.ViewModel) {
    router.routeToFleaMarketWriteForm()
  }
}

// MARK: - TableNode Delegate
extension RegionViewController: ASTableDataSource, ASTableDelegate {
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return regions.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      let cell = RegionSelectionCell()
      let item = self?.regions[indexPath.row].regionName ?? ""
      cell.configure(title: item)
      return cell
    }
  }
  
  func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
    interactor.fetchSelectedRegion(request: .init(indexPath: indexPath))
  }
}
