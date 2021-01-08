//
//  CategoryViewController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import AsyncDisplayKit
import Resolver
import RxSwift
import RxCocoa

protocol CategoryDisplayLogic: class {
  func displayArticleCategories(viewModel: CategoryModels.ArticleCategories.ViewModel)
  func displaySelectCategory(viewModel: CategoryModels.SelectCategory.ViewModel)
}

final class CategoryViewController: BaseASViewController {

  @Injected var interactor: CategoryBusinessLogic
  @Injected var router: (CategoryRoutingLogic & CategoryDataPassing)
  
  private var categories = [ArticleCategory]()
  
  private lazy var tableNode = ASTableNode().then {
    $0.dataSource = self
    $0.delegate = self
  }
}

// MARK: - Configure
extension CategoryViewController {
  override func configure() {
    guard let router = router as? CategoryRouter,
          let interactor = interactor as? CategoryInteractor,
          let presenter = interactor.presenter as? CategoryPresenter else { return }
    router.viewController = self
    presenter.viewController = self
    
    [
      requestArticleCategories(trigger: rx.viewWillAppear.asObservableVoid().take(1))
    ]
    .forEach { $0.disposed(by: disposeBag) }
  }
}

// MARK: - Layout
extension CategoryViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .zero,
      child: tableNode
    )
  }
}

// MARK: - Request
extension CategoryViewController {
  func requestArticleCategories(trigger: Observable<Void>) -> Disposable {
    trigger
      .bind { [weak self] in
        self?.interactor.fetchArticleCategories(request: .init())
      }
  }
}

// MARK: - Display
extension CategoryViewController: CategoryDisplayLogic {
  func displayArticleCategories(viewModel: CategoryModels.ArticleCategories.ViewModel) {
    categories = viewModel.articleCategories
    tableNode.reloadData()
  }
  
  func displaySelectCategory(viewModel: CategoryModels.SelectCategory.ViewModel) {
    router.routeToFleaMarketWriteForm()
  }
}

// MARK: - TableNode Delegate
extension CategoryViewController: ASTableDataSource, ASTableDelegate {
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      let cell = CategorySelectionCell()
      let item = self?.categories[indexPath.row].categoryName ?? ""
      cell.configure(title: item)
      return cell
    }
  }
  
  func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
    interactor.fetchSelectCategory(request: .init(indexPath: indexPath))
  }
}
