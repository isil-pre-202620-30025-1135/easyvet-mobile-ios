//
//  HomeViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 24/09/26.
//

import Combine

class HomeViewModel: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    private let repository: ProductRepository = ProductRepositoryImpl.shared
    
    
    func loadProducts() async {
        do {
            products = try await repository.getAllProducts()
        } catch let error {
            
        }
    }
        
}
