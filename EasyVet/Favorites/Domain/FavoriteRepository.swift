//
//  FavoriteRepository.swift
//  EasyVet
//
//  Created by Jorge Mayta on 29/10/26.
//

protocol FavoriteRepository {
    func getFavorites() throws -> [Int]
    func addFavorite(productId: Int) throws
    func removeFavorite(productId: Int) throws
}
