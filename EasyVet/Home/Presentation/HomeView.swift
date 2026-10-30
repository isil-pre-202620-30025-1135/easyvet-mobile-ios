//
//  HomeView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 24/09/26.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView  {
            LazyVGrid (columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]) {
                ForEach(viewModel.products) { product in
                    ProductCard(product: product, isFavorite: viewModel.isFavorite(productId: product.id)) {
                        try? viewModel.toggleFavorite(productId: product.id)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            await viewModel.loadProducts()
        }
        
        
    }
}


#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}
