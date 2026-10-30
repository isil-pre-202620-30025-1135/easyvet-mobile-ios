//
//  MainView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 17/09/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab {
                HomeView()
            } label: {
                Label("Home", systemImage: "house")
            }

            Tab {
                Text("Cart")
            } label: {
                Label("Cart", systemImage: "cart")
            }
            
            Tab {
                FavoritesView()
            } label: {
                Label("Whislist", systemImage: "heart")
            }
            
            Tab {
                Text("Profile")
            } label: {
                Label("Profile", systemImage: "person")
            }
        }
        .background(.gray.opacity(0.1))
        .tint(.green)
    }
}


#Preview {
    MainView()
}
