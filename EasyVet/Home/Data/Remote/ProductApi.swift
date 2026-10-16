//
//  ProductApi.swift
//  EasyVet
//
//  Created by Jorge Mayta on 15/10/26.
//

import Foundation

class ProductApi {
    
    static let shared = ProductApi()
    
    private init() {}
    
    private let session = URLSession.shared
    
    func getProducts() async throws -> [ProductDto] {
        
        let urlString = "https://petapi-591531460223.us-central1.run.app/api/products"
        
        guard let url = URL(string: urlString) else {
            
            return []
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return []
        }
        
        let productsDto = try JSONDecoder().decode(ProductsDto.self, from: data)
        
        return productsDto.products
        
    }
}
