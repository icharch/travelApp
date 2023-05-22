//
//  MainView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 22/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
   
    @ObservedObject var popularLocationsViewModel: PopularLocationsViewModel
    @State var searchLocation = ""
    @State var tabBar = TabBarView()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    ZStack {
                        VStack {
                            homeImage
                            Spacer(minLength: -45)
                            searchText
                        }
                    }
                    circleButtons
                    if popularLocationsViewModel.isLoading {
                        ZStack {
                            Color(.white)
                                .opacity(0.3)
                                .ignoresSafeArea()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                        }
                    } else {
                        popularLocations
                    }
                    recentLocations
                    blankText
                }
                .task {
                    await popularLocationsViewModel.fetchData()
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(popularLocationsViewModel: .init(locationService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/kahoolawe.jpg?alt=media&token=a2142070-3e8b-4792-9f5b-71bc08ee80b5"))
    }
}

private extension HomeView {
    
    var searchText: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search Location", text: $searchLocation)
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
        .padding()
    }
    
    var homeImage: some View {
        Image("mainView")
            .resizable()
            .scaledToFit()
    }
    
    var circleButtons: some View {
        HStack(spacing: 20) {
            NavigationLink {
                EventsView()
            } label: {
                VStack {
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.green)
                    Text("Events")
                }
                .frame(width: 70)
            }
            NavigationLink {
                RestaurantsView()
            } label: {
                VStack {
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.yellow)
                    Text("Restaurants")
                }
                .frame(width: 70)
            }
            NavigationLink {
                ShopsView()
            } label: {
                VStack {
                    Image(systemName: "cart.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.mint)
                    Text("Shops")
                }
                .frame(width: 70)
            }
            NavigationLink {
                CarsView()
            } label: {
                VStack {
                    Image(systemName: "car.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
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
                            WebImage(url: URL(string: randomLocation.image))
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
                                Text(recentLocation.type)
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
