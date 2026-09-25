//
//  ContentView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 10/09/26.
//

import SwiftUI

enum AppRoute: Hashable {
    case login
    case main
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            
            OnBoardingView {
                path.append(AppRoute.login)
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .login:
                    LoginView {
                        path.append(AppRoute.main)
                    }
                    .navigationBarBackButtonHidden()
                    
                case .main:
                    MainView().navigationBarBackButtonHidden()
                    
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
