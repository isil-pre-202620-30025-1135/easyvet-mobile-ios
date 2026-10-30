//
//  FavoritesView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 15/10/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                ForEach(viewModel.favoriteProducts) { product in
                    HStack {
                        
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
                        .frame(width: 96, height: 96)
                        
                        VStack (alignment: .leading) {
                            Text(product.name)
                            Text("\(product.price, specifier: "%.2f")").bold()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
