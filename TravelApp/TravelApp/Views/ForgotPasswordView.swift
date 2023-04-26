//
//  ForgotPasswordView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 26/04/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var email: String = ""
    
    var body: some View {
        VStack {
            forgotPasswordLabel
            subLabel
            enterEmailTextField
            Spacer()
        }
        .padding()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

private extension ForgotPasswordView {
    var forgotPasswordLabel: some View {
        Text("Forgot Password")
            .font(.custom("Quicksand-Bold", size: 30))
            .padding()
    }
    var subLabel: some View {
            Text("If you forgot your password, please enter your registered email to recover your password")
                .font(.custom("Quicksand-SemiBold", size: 13))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .padding()
    }
    var enterEmailTextField: some View {
        TextField("Enter email", text: $email)
            .font(.custom("Quicksand-Regular", size: 16))
            .padding()
            .background(
                    Color("SecondColor")
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                )
            .padding()
    }
}
