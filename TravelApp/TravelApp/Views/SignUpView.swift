//
//  SignUpView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 26/04/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @State var account: String = ""
    @State var password: String = ""
    @State var isSecured: Bool = true
    @State var email: String = ""
    @FocusState private var isEditing: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                signUpLabel
                welcomeLabel
                logInTextFields
                signUpButton
                Spacer()
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

private extension SignUpView {
    
    var signUpLabel: some View {
        Text("Sign Up")
            .font(.custom("Quicksand-Bold", size: 30))
            .padding()
    }
    
    var welcomeLabel: some View {
        VStack(alignment: .leading) {
            Text("Welcome!")
                .font(.custom("Quicksand-Bold", size: 20))
            Text("Please enter information to continue registration")
                .font(.custom("Quicksand-SemiBold", size: 13))
                .foregroundColor(Color.gray)
        }
        .padding()
    }
    
    var logInTextFields: some View {

        VStack(spacing: 20) {
            TextField("Account", text: $account)
                .font(.custom("Quicksand-Regular", size: 16))
                .padding()
                .background(
                    Color("SecondColor")
                        .cornerRadius(15)
                        .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
                )
                .focused($isEditing)
            
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
            .padding()
            .background(
                Color("SecondColor")
                    .cornerRadius(15)
                    .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
            )
            .focused($isEditing)
            
            TextField("Email", text: $email)
                .font(.custom("Quicksand-Regular", size: 16))
                .padding()
                .background(
                    Color("SecondColor")
                        .cornerRadius(15)
                        .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
                )
                .focused($isEditing)
        }
        .padding()
    }

    var signUpButton: some View {
        Button {
            //
        } label: {
            Text("Sign Up")
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

