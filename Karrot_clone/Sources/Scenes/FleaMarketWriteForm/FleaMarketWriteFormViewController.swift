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
  func displayCategoryScene(viewModel: FleaMarketWriteFormModels.CategoryScene.ViewModel)
  func displayRegionScene(viewModel: FleaMarketWriteFormModels.CategoryScene.ViewModel)
  func displaySelectedCategory(viewModel: FleaMarketWriteFormModels.SelectedCategory.ViewModel)
  func displaySelectedRegion(viewModel: FleaMarketWriteFormModels.SelectedRegion.ViewModel)
  func displayInputtedPrice(viewModel: FleaMarketWriteFormModels.InputtedPrice.ViewModel)
  func displaySubmitArticle(viewModel: FleaMarketWriteFormModels.SubmitArticle.ViewModel)
}

final class FleaMarketWriteFormViewController: BaseASViewController {

  @Injected var interactor: FleaMarketWriteFormBusinessLogic
  @Injected var router: (FleaMarketWriteFormRoutingLogic & FleaMarketWriteFormDataPassing)
  
  private let fleaMarketCellKinds = FleaMarketCellKind.allCases
  
  private let closeButton = UIButton().then {
    $0.setTitle("닫기", for: .normal)
    $0.setTitleColor(.systemBlue, for: .normal)
  }
  
  private let submitButton = UIButton().then {
    $0.setTitle("제출", for: .normal)
    $0.setTitleColor(.systemBlue, for: .normal)
  }
  
  private lazy var tableNode = ASTableNode().then {
    $0.dataSource = self
    $0.delegate = self
    $0.view.keyboardDismissMode = .onDrag
    $0.view.isScrollEnabled = true
    $0.view.separatorStyle = .none
  }
  
  private var keyboardHeight: CGFloat = 0
  private var currentPrice: String? = nil
  private var currentContent: String? = nil
}

// MARK: - Configure
extension FleaMarketWriteFormViewController {
  override func configure() {
    guard let router = router as? FleaMarketWriteFormRouter,
          let interactor = interactor as? FleaMarketWriteFormInteractor,
          let presenter = interactor.presenter as? FleaMarketWriteFormPresenter else { return }
    router.viewController = self
    presenter.viewController = self
    
    [
      requestSelectedCategory(trigger: rx.viewWillAppear.asObservableVoid()),
      requestSelectedRegion(trigger: rx.viewWillAppear.asObservableVoid()),
      requestSubmitArticle(trigger: submitButton.rx.tap.asObservable())
    ]
    .forEach { $0.disposed(by: disposeBag) }
  }
}

// MARK: - SetupUI
extension FleaMarketWriteFormViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = closeButton.asBarButtonItem()
    navigationItem.rightBarButtonItem = submitButton.asBarButtonItem()
    
    closeButton.rx.tap
      .bind { [weak self] in
        self?.dismiss(animated: true)
      }.disposed(by: disposeBag)
    
    RxKeyboard.instance.visibleHeight
      .drive(onNext: { [weak self] in
        guard let `self` = self else { return }
        self.keyboardHeight = $0
        self.node.setNeedsLayout()
      }).disposed(by: disposeBag)
  }
}

// MARK: - Layout
extension FleaMarketWriteFormViewController {
  override func layoutSpec(node: ASDisplayNode, size: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(
      insets: .init(top: 0, left: 0, bottom: keyboardHeight, right: 0),
      child: tableNode
    )
  }
}

// MARK: - Request
extension FleaMarketWriteFormViewController {
  func requestSelectedCategory(trigger: Observable<Void>) -> Disposable {
    trigger
      .bind { [weak self] in
        self?.interactor.fetchSelectedCategory(request: .init())
      }
  }
  
  func requestSelectedRegion(trigger: Observable<Void>) -> Disposable {
    trigger
      .bind { [weak self] in
        self?.interactor.fetchSelectedRegion(request: .init())
      }
  }
  
  func requestSubmitArticle(trigger: Observable<Void>) -> Disposable {
    trigger
      .bind { [weak self] in
        self?.interactor.fetchSubmitArticle(
          request: .init(
            price: self?.currentContent,
            content: self?.currentContent
          )
        )
      }
  }
}

// MARK: - Display
extension FleaMarketWriteFormViewController: FleaMarketWriteFormDisplayLogic {
  func displayCategoryScene(viewModel: FleaMarketWriteFormModels.CategoryScene.ViewModel) {
    router.routeToCategory()
  }
  
  func displayRegionScene(viewModel: FleaMarketWriteFormModels.CategoryScene.ViewModel) {
    router.routeToRegion()
  }
  
  func displaySelectedCategory(viewModel: FleaMarketWriteFormModels.SelectedCategory.ViewModel) {
    let row = fleaMarketCellKinds.enumerated().first { $0.element == .category }.map { $0.offset }
    let indexPath = IndexPath(row: row ?? 0, section: 0)
    let cell = tableNode.nodeForRow(at: indexPath) as? FleaMarketSelectionCell
    cell?.configure(title: viewModel.categoryName)
  }
  
  func displaySelectedRegion(viewModel: FleaMarketWriteFormModels.SelectedRegion.ViewModel) {
    let row = fleaMarketCellKinds.enumerated().first { $0.element == .region }.map { $0.offset }
    let indexPath = IndexPath(row: row ?? 1, section: 0)
    let cell = tableNode.nodeForRow(at: indexPath) as? FleaMarketSelectionCell
    cell?.configure(title: viewModel.regionName)
  }
  
  func displayInputtedPrice(viewModel: FleaMarketWriteFormModels.InputtedPrice.ViewModel) {
    let row = fleaMarketCellKinds.enumerated().first { $0.element == .price }.map { $0.offset }
    let indexPath = IndexPath(row: row ?? 2, section: 0)
    let cell = tableNode.nodeForRow(at: indexPath) as? FleaMarketPriceInputCell
    cell?.configure(viewModel.price)
  }
  
  func displaySubmitArticle(viewModel: FleaMarketWriteFormModels.SubmitArticle.ViewModel) {
    showAlert(
      title: viewModel.title,
      message: viewModel.errorMessage,
      button: "확인"
    ) { [weak self] _ in
      guard viewModel.isSuccess else { return }
      self?.dismiss(animated: true)
    }
  }
}

// MARK: - TableNode Decorate
extension FleaMarketWriteFormViewController: ASTableDataSource, ASTableDelegate {
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return fleaMarketCellKinds.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      guard let `self` = self else { return ASCellNode() }
      switch self.fleaMarketCellKinds[indexPath.row] {
      case .category:
        let cell = FleaMarketSelectionCell()
        cell.configure(title: "카테고리 선택")
        return cell
      case .region:
        let cell = FleaMarketSelectionCell()
        cell.configure(title: "게시글 보여줄 동네 고르기")
        return cell
      case .price:
        let cell = FleaMarketPriceInputCell()
        cell.delegate = self
        return cell
      case .content:
        let cell = FleaMarketContentFieldCell()
        cell.delegate = self
        return cell
      }
    }
  }
  
  func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
    switch fleaMarketCellKinds[indexPath.row] {
    case .category: interactor.fetchCategoryScene(request: .init())
    case .region: interactor.fetchRegionScene(request: .init())
    default:
      return
    }
  }
}

extension FleaMarketWriteFormViewController: FleaMarketPriceInputCellDelegate {
  func didEndEditing(text: String?) {
    interactor.fetchInputtedPrice(request: .init(price: text))
  }
  
  func textChanged(_ text: String?) {
    currentPrice = text
  }
}

extension FleaMarketWriteFormViewController: FleaMarketContentFieldCellDelegate {
  func chagnedTextViewLineOfNumbers() {
    tableNode.scrollToRow(
      at: .init(row: fleaMarketCellKinds.count - 1, section: 0),
      at: .bottom,
      animated: true
    )
  }
  
  func textChanged(_ textView: UITextView, _ text: String?) {
    currentContent = text
  }
}
