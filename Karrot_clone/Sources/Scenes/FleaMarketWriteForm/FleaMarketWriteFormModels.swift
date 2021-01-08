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
  
  enum SelectedRegion {
    struct Request {}
    struct Response {
      let selectedRegion: Region
    }
    struct ViewModel {
      let regionName: String
    }
  }
  
  enum InputtedPrice {
    struct Request {
      let price: String?
    }
    struct Response {
      let price: Int
    }
    struct ViewModel {
      let price: Int
    }
  }
  
  enum SubmitArticle {
    struct Request {
      let price: String?
      let content: String?
    }
    struct Response {
      let fleaMarketArticle: FleaMarketArticle
    }
    struct ViewModel {
      let isSuccess: Bool
      let title: String
      let errorMessage: String?
    }
  }
}
