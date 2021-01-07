//
//  ObservableType.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import RxSwift

extension ObservableType {
  
  func withPrevious(startWith first: Element) -> Observable<(Element, Element)> {
    return scan((first, first)) { ($0.1, $1) }
  }
}
