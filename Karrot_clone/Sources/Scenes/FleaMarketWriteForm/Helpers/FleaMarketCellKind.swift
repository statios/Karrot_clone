//
//  FleaMarketCellFactory.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//

import AsyncDisplayKit

enum FleaMarketCellKind: CaseIterable {
  case category
  case region
  case price
  case content
}

extension FleaMarketCellKind {
  var cell: ASCellNode {
    switch self {
    case .category:
      let cell = FleaMarketSelectionCell()
      cell.configure(title: "카테고리 선택")
      return cell
    case .region:
      let cell = FleaMarketSelectionCell()
      cell.configure(title: "게시글 보여줄 동네 고르기")
      return cell
    case .price: return FleaMarketPriceInputCell()
    case .content: return FleaMarketContentFieldCell()
    }
  }
  
  var errorMessage: String? {
    switch self {
    case .category: return "- 카테고리를 선택해주세요."
    case .region: return "- 동네를 선택해주세요."
    case .price: return nil
    case .content: return "- 내용을 입력해주세요."
    }
  }
}
