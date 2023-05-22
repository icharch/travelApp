//
//  RestaurantsView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 21/05/2023.
//

import SwiftUI

struct RestaurantsView: View {
    
    @State var enterSearch = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                searchText
                VStack(spacing: 15) {
                    american
                    coffeehouse
                    italian
                    mediterranean
                    seafood
                }
                blankText
            }
        }
    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}

private extension RestaurantsView {
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
    
    var american: some View {
        ZStack {
            Image("american")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("American")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var coffeehouse: some View {
        ZStack {
            Image("coffee")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Coffeehouse")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var italian: some View {
        ZStack {
            Image("italian")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Italian")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var mediterranean: some View {
        ZStack {
            Image("mediterranean")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Mediterranean")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var seafood: some View {
        ZStack {
            Image("seafood")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Seafood")
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
