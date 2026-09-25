//
//  OnBoardingView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 10/09/26.
//

import SwiftUI

struct OnBoardingView: View {
    
    let onSignIn: () -> Void
    
    var body: some View {
        
        VStack(spacing: 16) {
            Image("background")
                .resizable()
                .scaledToFit()
            Text("From Bowl to Soul\nWe've Got It All").multilineTextAlignment(.center).font(.title).bold()
            
            
            Button {
            } label: {
                Text("Create Account")
                    .tint(.white)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Button {
                onSignIn()
            } label: {
                Text("Sign In")
                    .tint(.green)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16).stroke(.green, lineWidth: 1)
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal)
        .background(.gray.opacity(0.1))
    
    }
    
    
}

#Preview {
    OnBoardingView {}
}
