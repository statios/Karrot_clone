//
//  BaseCellNode.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

import Foundation
import AsyncDisplayKit
import RxSwift

class BaseCellNode: ASCellNode {
  
  var disposeBag = DisposeBag()
  
  override init() {
    super.init()
    automaticallyManagesSubnodes = true
    selectionStyle = .none
  }
}


