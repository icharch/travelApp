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
    @FocusState private var isTyping: Bool
    @FocusState private var isTapped: Bool
    @State private var accountTextFieldError: TextFieldError?
    @State private var passwordTextFieldError: TextFieldError?
    @State private var isEmailValid: Bool = true
    
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
    
    enum TextFieldError {
        case tooShort
        
        var description: String {
            switch self {
            case .tooShort:
              return "Value is too short"
            }
        }
    }
    
    var logInTextFields: some View {
        VStack(spacing: 20) {
            VStack {
                TextField("Account", text: $account)
                    .font(.custom("Quicksand-Regular", size: 16))
                    .padding()
                    .background(
                        Color("SecondColor")
                            .cornerRadius(15)
                            .shadow(color: isEditing ? .orange : .gray, radius: 2, x: 0, y: 2)
                    )
                    .focused($isEditing)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                if let error = accountTextFieldError {
                    HStack {
                        Text(error.description)
                            .font(.custom("Quicksand-Medium", size: 10))
                            .foregroundColor(.red)
                            .onAppear(perform: nil)
                        Spacer()
                    }
                }
            }
            
            VStack {
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
                        .shadow(color: isTyping ? .orange : .gray, radius: 2, x: 0, y: 2)
                )
                .focused($isTyping)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                
                if let error = passwordTextFieldError {
                    HStack {
                        Text(error.description)
                            .font(.custom("Quicksand-Medium", size: 10))
                            .foregroundColor(.red)
                            .onAppear(perform: nil)
                        Spacer()
                    }
                }
            }
            
            VStack {
                TextField("Email", text: $email)
                    .font(.custom("Quicksand-Regular", size: 16))
                    .padding()
                    .background(
                        Color("SecondColor")
                            .cornerRadius(15)
                            .shadow(color: isTapped ? .orange : .gray, radius: 2, x: 0, y: 2)
                    )
                    .focused($isTapped)
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
                }
            }
        }
        .padding()
    }
    
    var signUpCredentialsAreValid: Bool {
        return !account.isEmpty || !password.isEmpty || !email.isEmpty
    }
    
    var signUpButtonColor: Color {
        return signUpCredentialsAreValid ? .orange : .gray
    }

    var signUpButton: some View {
        Button {
            if account.count < 4 {
                accountTextFieldError = .tooShort
            }
            if password.count < 6 {
                passwordTextFieldError = .tooShort
            }
            if self.textFieldValidatorEmail(self.email) {
                self.isEmailValid = true
            } else {
                self.isEmailValid = false
                self.email = ""
            }
        } label: {
            Text("Sign Up")
                .font(.custom("Quicksand-Bold", size: 16))
                .foregroundColor(Color("SecondColor"))
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    signUpButtonColor
                        .cornerRadius(15)
                )
                .padding()
        }
        .disabled(!signUpCredentialsAreValid)
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

