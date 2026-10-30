//
//  FavoriteEntity.swift
//  EasyVet
//
//  Created by Jorge Mayta on 29/10/26.
//

import SwiftData

@Model
class FavoriteEntity {
    
    @Attribute(.unique)
    var productId: Int
    
    init(productId: Int) {
        self.productId = productId
    }
    
}
