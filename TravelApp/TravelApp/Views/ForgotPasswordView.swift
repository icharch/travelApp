//
//  ForgotPasswordView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 26/04/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var email: String = ""
    @FocusState private var isEditing: Bool
    @State private var isEmailValid: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                forgotPasswordLabel
                subLabel
                enterEmailTextField
                continueButton
                Spacer()
            }
            .padding()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

private extension ForgotPasswordView {
    
    var enteredEmailIsValid: Bool {
        return !email.isEmpty
    }
    var continueButtonColor: Color {
        return enteredEmailIsValid ? .orange : .gray
    }
    
    var continueButton: some View {
        Button {
            if self.textFieldValidatorEmail(self.email) {
                self.isEmailValid = true
            } else {
                self.isEmailValid = false
                self.email = ""
            }
        } label: {
            Text("Continue")
                .font(.custom("Quicksand-Bold", size: 16))
                .foregroundColor(Color("SecondColor"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    continueButtonColor
                        .cornerRadius(15)
                )
                .padding()
        }
        .disabled(!enteredEmailIsValid)
    }
    
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
        VStack(spacing: 0) {
            TextField("Enter email", text: $email)
                .font(.custom("Quicksand-Regular", size: 16))
                .padding()
                .background(
                        Color("SecondColor")
                        .cornerRadius(15)
                        .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
                )
                .padding()
                .focused($isEditing)
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            if !self.isEmailValid {
                HStack {
                    Text("Email is not valid")
                        .font(.custom("Quicksand-Medium", size: 10))
                        .foregroundColor(.red)
                        .onAppear(perform: nil)
                    Spacer()
                }
                .padding(.leading)
            }
        }
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
            if string.count > 100 {
                return false
            }
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: string)
    }
}
