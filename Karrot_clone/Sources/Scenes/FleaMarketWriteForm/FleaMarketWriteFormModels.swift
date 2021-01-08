//
//  FleaMarketWriteFormModels.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/06.
//

enum FleaMarketWriteFormModels {

  enum CategoryScene {
    struct Request {}
    struct Response {}
    struct ViewModel {}
  }
  
  enum RegionScene {
    struct Request {}
    struct Response {}
    struct ViewModel {}
  }
  
  enum SelectedCategory {
    struct Request {}
    struct Response {
      let selectedCategory: ArticleCategory
    }
    struct ViewModel {
      let categoryName: String
    }
  }
}
