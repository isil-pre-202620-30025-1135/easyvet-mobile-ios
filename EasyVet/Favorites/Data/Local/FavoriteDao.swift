//
//  FavoriteDao.swift
//  EasyVet
//
//  Created by Jorge Mayta on 29/10/26.
//

import SwiftData
import Foundation

class FavoriteDao {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getFavorites() throws -> [FavoriteEntity] {
        let descriptor = FetchDescriptor<FavoriteEntity>()
        
        return try context.fetch(descriptor)
    }
    
    func addFavorite(productId: Int) throws {
        let entity = FavoriteEntity(productId: productId)
        context.insert(entity)
        
        try context.save()
    }
    
    func removeFavorite(productId: Int) throws {
        let predicate = #Predicate<FavoriteEntity> { entity in
            entity.productId == productId
        }
        
        let descriptor = FetchDescriptor<FavoriteEntity>(predicate: predicate)
        
        let favorites = try context.fetch(descriptor)
        
        for favorite in favorites {
            context.delete(favorite)
        }
        try context.save()
    }
}
