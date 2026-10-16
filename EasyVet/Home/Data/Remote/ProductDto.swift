//
//  ProductDto.swift
//  EasyVet
//
//  Created by Jorge Mayta on 15/10/26.
//

struct ProductDto: Decodable {

    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
    let rating: Double
    let stock: Int
}
