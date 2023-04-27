//
//  LogInView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 26/04/2023.
//

import SwiftUI

struct SignInView: View {
    
    @State var account: String = ""
    @State var password: String = ""
    @State var isSecured: Bool = true
    @FocusState private var isEditing: Bool

    var body: some View {
        NavigationView {
            VStack {
                signInLabel
                welcomeLabel
                logInTextFields
                navigationButtons
                signInButton
                Spacer()
            }
            .padding()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInView()
        }
    }
}

private extension SignInView {
    
    var signInLabel: some View {
        Text("Sign In")
            .font(.custom("Quicksand-Bold", size: 30))
            .padding(.bottom)
    }
    
    var welcomeLabel: some View {
        VStack(alignment: .leading) {
            Text("Welcome!")
                .font(.custom("Quicksand-Bold", size: 20))
            Text("Please enter your account and password to continue")
                .font(.custom("Quicksand-SemiBold", size: 13))
                .foregroundColor(Color.gray)
        }
        .padding()
    }
    
    var accountTextField: some View {
        TextField("Account", text: $account)
            .font(.custom("Quicksand-Regular", size: 16))
            .padding()
            .background(
                Color("SecondColor")
                    .cornerRadius(15)
                    .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
            )
            .focused($isEditing)
    }
    
    var passwordTextField: some View {
        HStack {
            if isSecured == true {
                SecureField("Password", text: $password)
                    .font(.custom("Quicksand-Regular", size: 16))
            } else {
                TextField("Password", text: $password)
                    .font(.custom("Quicksand-Regular", size: 16))
            }
            Button {
                isSecured.toggle()
            } label: {
                Image(systemName: isSecured ? "eye.slash" : "eye")
                    .foregroundColor(.secondary)
            }
        }
        .focused($isEditing)
        .padding()
        .background(
            Color("SecondColor")
                .cornerRadius(15)
                .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
        )
    }
    
    var logInTextFields: some View {
        
        VStack(spacing: 20) {
            accountTextField
            passwordTextField
        }
        .padding()
    }
    
    var navigationButtons: some View {
        HStack {
            NavigationLink(destination: ForgotPasswordView(), label: {
                Text("Forgot Password")
            })
            Spacer()
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up")
            }
        }
        .font(.custom("Quicksand-Medium", size: 13))
        .foregroundColor(.orange)
        .padding(.horizontal)
    }
    
    var signInButton: some View {
        Button {
            //
        } label: {
            Text("Sign In")
                .font(.custom("Quicksand-Bold", size: 16))
                .foregroundColor(Color("SecondColor"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    Color.orange
                        .cornerRadius(15)
                )
                .padding()
        }
    }
}

