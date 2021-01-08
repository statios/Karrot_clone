//
//  CategoryModels.swift
//  Karrot_clone
//
//  Created by KIHYUN SO on 2021/01/07.
//
import UIKit

enum CategoryModels {

  enum ArticleCategories {
    struct Request { }
    struct Response {
      let result: [ArticleCategory]
    }
    struct ViewModel {
      let articleCategories: [ArticleCategory]
    }
  }
  
  enum SelectCategory {
    struct Request {
      let indexPath: IndexPath
    }
    struct Response {
    }
    struct ViewModel {
    }
  }
  
}
