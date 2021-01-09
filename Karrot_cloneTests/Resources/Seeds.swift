//
//  Seeds.swift
//  Karrot_cloneTests
//
//  Created by KIHYUN SO on 2021/01/10.
//

@testable import Karrot_clone

struct Seeds { }

extension Seeds {
  static let articleCategory = ArticleCategory(id: 1, categoryName: "디지털/가전")
  static let articleCategories = [
    ArticleCategory(id: 1, categoryName: "디지털/가전"),
    ArticleCategory(id: 2, categoryName: "게임"),
    ArticleCategory(id: 3, categoryName: "스포츠/레저"),
    ArticleCategory(id: 4, categoryName: "유아/아동용품"),
    ArticleCategory(id: 5, categoryName: "여성패션/잡화"),
    ArticleCategory(id: 6, categoryName: "뷰티/미용"),
    ArticleCategory(id: 7, categoryName: "남성패션/잡화"),
    ArticleCategory(id: 8, categoryName: "생활/식품"),
    ArticleCategory(id: 9, categoryName: "가구"),
    ArticleCategory(id: 10, categoryName: "도서/티켓/취미"),
    ArticleCategory(id: 11, categoryName: "기타"),
  ]
}

extension Seeds {
  static let region = Region(id: 1, regionName: "내동네")
  static let regions = [
    Region(id: 1, regionName: "내동네"),
    Region(id: 2, regionName: "인접동네"),
    Region(id: 3, regionName: "근처동네")
  ]
}

extension Seeds {
  static let fleaMarketArticle: FleaMarketArticle = .init(
    content: "content",
    price: 10000,
    isFreePrice: false,
    regionID: 1,
    categoryID: 1
  )
}
