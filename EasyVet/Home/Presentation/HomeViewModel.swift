//
//  HomeViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 24/09/26.
//

import Combine

class HomeViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var favoriteProductsId: [Int] = []
    
    var favoriteProducts: [Product] {
        get {
            return products.filter { product in
                isFavorite(productId: product.id)
            }
        }
    }
    
    private let repository = ProductRepositoryImpl.shared
    private let favoriteRepository = FavoriteRepositoryImpl.shared
    
    func loadProducts() async {
        do {
            products = try await repository.getAllProducts()
            favoriteProductsId = try favoriteRepository.getFavorites()
        } catch _ {
            
        }
    }
    
    func toggleFavorite(productId: Int) throws {
        if (isFavorite(productId: productId)) {
            try favoriteRepository.removeFavorite(productId: productId)
        } else {
            try favoriteRepository.addFavorite(productId: productId)
        }
        
        favoriteProductsId = try favoriteRepository.getFavorites()

    }
    
    func isFavorite(productId: Int) -> Bool {
        return favoriteProductsId.contains([productId])
    }
    
   
        
}
