//
//  ProductRepositoryImpl.swift
//  EasyVet
//
//  Created by Jorge Mayta on 15/10/26.
//

class ProductRepositoryImpl: ProductRepository {
    private let api = ProductApi.shared
    
    static let shared = ProductRepositoryImpl()
    
    private init() {}
    
    func getAllProducts() async throws -> [Product] {
        let dtos = try await api.getProducts()
        
        return dtos.map { dto in
            Product(id: dto.id,
                    name: dto.title,
                    price: dto.price,
                    rating: dto.rating,
                    image: dto.image)
        }
    }
    
    
}
