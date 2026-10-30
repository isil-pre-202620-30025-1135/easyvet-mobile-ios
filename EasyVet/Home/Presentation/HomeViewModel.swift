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
    
    private let repository: ProductRepository = ProductRepositoryImpl.shared
    
    
    func loadProducts() async {
        do {
            products = try await repository.getAllProducts()
        } catch _ {
            
        }
    }
    
    func toggleFavorite(id: Int) {
        if !favoriteProductsId.contains(id) {
            favoriteProductsId.append(id)
        } else {
            favoriteProductsId.removeAll { item in
                item == id
            }
        }
    }
    
   
        
}
