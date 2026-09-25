//
//  LoginView.swift
//  EasyVet
//
//  Created by Jorge Mayta on 17/09/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isHidden = true
    
    let onLogin: () -> Void
   
    
    var body: some View {
        VStack (spacing: 16){
            
            TextField("Email", text: $email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .frame(height: 24)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack {
                Group {
                    if isHidden {
                        SecureField("Password", text: $password)
                            .autocorrectionDisabled()
                    } else {
                        TextField("Password", text: $password)
                            .autocorrectionDisabled()
                    }
                }
                Button {
                    isHidden.toggle()
                } label: {
                    Image(systemName:
                            isHidden ? "eye.slash" : "eye")
                        .tint(.green)
                }

            }
            .frame(height: 24)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Button {
                onLogin()
            } label: {
                Text("Sign in")
                    .tint(.white)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal)
        .background(.gray.opacity(0.1))
    }
}

#Preview {
    LoginView {}
}
