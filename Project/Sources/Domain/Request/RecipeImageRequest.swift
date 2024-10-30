//
//  RecipeImageRequest.swift
//  oeCook
//
//  Created by 서지완 on 10/30/24.
//

import Foundation

public struct RecipeImageRequest: Encodable {
    var id: String
    var image: String?


    public init(id: String, image: String?) {
        self.id = id
        self.image = image

    }
}
