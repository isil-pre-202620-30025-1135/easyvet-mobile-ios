//
//  FavoriteRepositoryImpl.swift
//  EasyVet
//
//  Created by Jorge Mayta on 29/10/26.
//

class FavoriteRepositoryImpl: FavoriteRepository {
    private let dao: FavoriteDao = FavoriteDao.shared
    
    static let shared = FavoriteRepositoryImpl()
    
    private init() {}
    
    func getFavorites() throws -> [Int] {
        let favorites = try dao.getFavorites()
        return favorites.map { entity in
            entity.productId
        }
    }
    
    func addFavorite(productId: Int) throws {
        try dao.addFavorite(productId: productId)
    }
    
    func removeFavorite(productId: Int) throws {
        try dao.removeFavorite(productId: productId)
    }
    
    
}
