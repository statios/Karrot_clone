//
//  BaseASTabBarController.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import AsyncDisplayKit
import RxSwift

class BaseAsTabBarController: ASTabBarController {
  
  var disposeBag = DisposeBag()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    Log.verbose(String(describing: Self.self))
    configure()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func configure() {
    
  }
}

