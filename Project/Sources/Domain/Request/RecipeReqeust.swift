//
//  RecipeReqeust.swift
//  oeCook
//
//  Created by 서지완 on 10/30/24.
//

import Foundation

public struct RecipeRequest: Codable {
    var companyName: String
    var isProduct: Bool
    var menu: String
    var price: String
    var explanation: String
    var isVegan: Bool
    var isHalal: Bool
    var category: String
    var isSpicy: Bool
    var isHot: Bool

    public init(companyName: String, isProduct: Bool, menu: String, price: String, explanation: String, isVegan: Bool, isHalal: Bool, category: String, isSpicy: Bool, isHot: Bool) {
        self.companyName = companyName
        self.isProduct = isProduct
        self.menu = menu
        self.price = price
        self.explanation = explanation
        self.isVegan = isVegan
        self.isHalal = isHalal
        self.category = category
        self.isSpicy = isSpicy
        self.isHot = isHot
    }
}


