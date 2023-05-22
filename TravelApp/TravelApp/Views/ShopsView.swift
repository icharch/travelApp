//
//  ShopsView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 21/05/2023.
//

import SwiftUI

struct ShopsView: View {
    
    @State var enterSearch = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                searchText
                VStack(spacing: 15) {
                    boutique
                    giftShop
                    grocery
                    shoppingMall
                }
                blankText
            }
        }
    }
}

struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
    }
}

private extension ShopsView {
    var searchText: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Enter search", text: $enterSearch)
                .font(.custom("Quicksand-Regular", size: 16))
                .autocorrectionDisabled()
            Spacer()
        }
        .padding()
        .background(
            Color("SecondColor")
                .cornerRadius(15)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
    
    var boutique: some View {
        ZStack {
            Image("boutique")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Boutique")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var giftShop: some View {
        ZStack {
            Image("gift shop")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Gift Shop")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var grocery: some View {
        ZStack {
            Image("grocery1")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Grocery")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var shoppingMall: some View {
        ZStack {
            Image("shopping mall")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Shopping Mall")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var blankText: some View {
        VStack {
            Text("")
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}
