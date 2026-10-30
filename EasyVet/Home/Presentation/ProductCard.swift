//
//  ProductCard.swift
//  EasyVet
//
//  Created by Jorge Mayta on 24/09/26.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    let isFavorite: Bool
    let onToggleFavorite: () -> Void
    
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            VStack(alignment: .leading, spacing: 8) {
                
                AsyncImage(url: URL(string: product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .failure:
                        Image(systemName: "photo")
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                
                Text(product.name).bold().lineLimit(1)
                HStack {
                    Image(systemName: "star")
                    Text("\(product.rating, specifier: "%.1f")")
                }
                Text("\(product.price, specifier: "%.2f")").bold()
                
            }
            
            Button {
                onToggleFavorite()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    
            }
            .frame(width: 24, height: 24)
            

        }
        
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        

    }
}


#Preview {
    ProductCard(
        product:  Product(id: 1, name: "Royal Canin Maxi Puppy", price: 42.5, rating: 4.8, image: "https://i.imgur.com/WkZEOU6.png"), isFavorite: false
    ) {}
}
