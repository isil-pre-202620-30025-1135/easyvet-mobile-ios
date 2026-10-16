//
//  ProductRepository.swift
//  EasyVet
//
//  Created by Jorge Mayta on 24/09/26.
//

protocol ProductRepository {
    func getAllProducts() async throws -> [Product]
}
