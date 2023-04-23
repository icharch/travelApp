//
//  MainView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 22/04/2023.
//

import SwiftUI

struct MainView: View {
   
    @ObservedObject var popularLocationsViewModel: PopularLocationsViewModel


    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                mainImage
                circleButtons
                popularLocations
            }
            .onAppear {
                popularLocationsViewModel.fetchData()
            }
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(popularLocationsViewModel: .init(locationService: .init()))
    }
}

private extension MainView {
    
    var mainImage: some View {
        Image("mainView")
            .resizable()
            .scaledToFit()
    }
    
    var circleButtons: some View {
        HStack(spacing: 20) {
            Button {
                //action
            } label: {
                VStack {
                    Image(systemName: "cart.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                    Text("Shops")
                }
                .frame(width: 70)
            }
            Button {
                //action
            } label: {
                VStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.green)
                    Text("Restaurants")
                }
                .frame(width: 70)
            }
            Button {
                //action
            } label: {
                VStack {
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                    Text("Events")
                }
                .frame(width: 70)
            }
            Button {
                //action
            } label: {
                VStack {
                    Image(systemName: "car.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.yellow)
                    Text("Cars")
                }
                .frame(width: 70)
            }
        }
        .font(.custom("Quicksand-Regular", size: 12))
        .foregroundColor(.accentColor)
    }
    
    var popularLocations: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Popular Locations")
                    .font(.custom("Quicksand-Bold", size: 24))
                Spacer()
            }
            .padding(.leading)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(popularLocationsViewModel.popularLocations, id: \.id) {
                        randomLocation in
                        ZStack {
                            Image("\(randomLocation.image)")
                                .resizable()
                                .frame(width: 150, height: 200)
                                .cornerRadius(15)
                                .scaledToFill()
                            VStack {
                                Spacer()
                                HStack {
                                    Text(randomLocation.name)
                                        .font(.custom("Quicksand-Bold", size: 18))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                    }
                    

//                    ZStack {
//                        Image("kauai")
//                            .resizable()
//                            .frame(width: 150, height: 200)
//                            .cornerRadius(15)
//                            .scaledToFill()
//                        VStack {
//                            Spacer()
//                            HStack {
//                                Text("Kauai")
//                                    .font(.custom("Quicksand-Bold", size: 18))
//                                    .foregroundColor(.white)
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
//
//                    ZStack {
//                        Image("maui")
//                            .resizable()
//                            .frame(width: 150, height: 200)
//                            .cornerRadius(15)
//                            .scaledToFill()
//                        VStack {
//                            Spacer()
//                            HStack {
//                                Text("Maui")
//                                    .font(.custom("Quicksand-Bold", size: 18))
//                                    .foregroundColor(.white)
//                                Spacer()
//                            }
//                            .padding()
//                        }
//                    }
                        
                }
            }
            .padding(.leading)
            .scrollIndicators(.hidden)
        }


            
    }
}
