//
//  MainView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 22/04/2023.
//

import SwiftUI

struct MainView: View {
   
    @ObservedObject var popularLocationsViewModel: PopularLocationsViewModel
    @State var searchLocation = ""

    var body: some View {
            ScrollView {
                    VStack(spacing: 25) {
                        ZStack {
                            VStack {
                                mainImage
                                Spacer(minLength: -45)
                                searchText
                            }
                        }
                        circleButtons
                        popularLocations
                        recentLocations
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
    
    var tabView: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("Discovery")
                .tabItem {
                    Label("Discovery", systemImage: "mappin.and.ellipse")
                }
            Text("Account")
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
        .accentColor(.red)
    }
    
    var searchText: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search Location", text: $searchLocation)
                .font(.custom("Quicksand-Regular", size: 16))
            Spacer()
        }
        .padding()
        .background(
            Color("SecondColor")
                .cornerRadius(15)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        .padding()
    }
    
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
        VStack(spacing: 20) {
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
                }
            }
            .padding(.leading)
            .scrollIndicators(.hidden)
        }
    }
    
    var recentLocations: some View {
        VStack(spacing: 20) {
            VStack {
                HStack {
                    Text("Recent Locations")
                        .font(.custom("Quicksand-Bold", size: 24))
                    Spacer()
                }
                HStack {
                    Text("Let's find out the nice places to eat")
                        .font(.custom("Quicksand-Regular", size: 15))
                    Spacer()
                }
            }
            .padding(.leading)
            
            ForEach(popularLocationsViewModel.recentLocations, id: \.id) {
                recentLocation in
                HStack {
                    Image(recentLocation.image)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(18)
                        .scaledToFill()
                    HStack {
                        VStack {
                            HStack {
                                Text(recentLocation.name)
                                    .font(.custom("Quicksand-Bold", size: 15))
                                Spacer()
                            }
                            HStack {
                                Text(recentLocation.cuisine)
                                    .font(.custom("Quicksand-Light", size: 12))
                                Spacer()
                            }
                            HStack {
                                Text(recentLocation.rate)
                                    .font(.custom("Quicksand-Bold", size: 10))
                                    .foregroundColor(.white)
                                    .frame(width: 22, height: 20)
                                    .background(.green)
                                    .background(in: RoundedRectangle(cornerRadius: 5))
                                
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                        Rectangle()
                                            .fill(Color.yellow)
                                            .frame(width: geometry.size.width * recentLocation.starRate / 5)
                                    }
                                }
                                .mask(
                                    HStack(spacing: 5) {
                                        Image(systemName: "star.fill")
                                            .resizable()
                                        Image(systemName: "star.fill")
                                            .resizable()
                                        Image(systemName: "star.fill")
                                            .resizable()
                                        Image(systemName: "star.fill")
                                            .resizable()
                                        Image(systemName: "star.fill")
                                            .resizable()
                                    }
                                )
                                .foregroundColor(.gray.opacity(0.5))
                                .frame(width: 90, height: 15)
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.leading)
            }
        }
    }
}
