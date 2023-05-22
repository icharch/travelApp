//
//  CarsView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 21/05/2023.
//

import SwiftUI

struct CarsView: View {
    
    @State var enterSearch = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                searchText
                VStack(spacing: 15) {
                    convertible
                    premium
                    suv
                }
                blankText
            }
        }
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}

private extension CarsView {
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
    
    var convertible: some View {
        ZStack {
            Image("convert")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Convertible")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var premium: some View {
        ZStack {
            Image("premium su")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Premium")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var suv: some View {
        ZStack {
            Image("full size su")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("SUV")
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
