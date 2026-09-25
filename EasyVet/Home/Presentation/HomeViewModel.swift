//
//  HomeViewModel.swift
//  EasyVet
//
//  Created by Jorge Mayta on 24/09/26.
//

import Combine

class HomeViewModel: ObservableObject {
    
    @Published private(set) var products = [
        Product(id: 1, name: "Royal Canin Maxi Puppy", price: 42.5, rating: 4.8, image: "https://i.imgur.com/WkZEOU6.png"),
        Product(id: 2, name: "Eukanuba Active Adult", price: 72.9, rating: 4.7, image: "https://i.imgur.com/guSk1sh.png"),
        Product(id: 3, name: "Royal Canin Maxi Puppy", price: 42.5, rating: 4.8, image: "https://i.imgur.com/WkZEOU6.png"),
        Product(id: 4, name: "Eukanuba Active Adult", price: 72.9, rating: 4.7, image: "https://i.imgur.com/guSk1sh.png")
    ]
}
