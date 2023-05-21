//
//  DiscoveryView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 04/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoveryView: View {
    
    @State var searchLocation = ""
    @ObservedObject var carsToRentViewModel: CarsToRentViewModel
    @ObservedObject var eventsViewModel: EventsViewModel
    @ObservedObject var restaurantsViewModel: RestaurantsViewModel
    @ObservedObject var shopsViewModel: ShopsViewModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                searchText
                eventsSection
                if eventsViewModel.isLoading {
                    ZStack {
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    }
                } else {
                    events
                }
                restaurantsSection
                if restaurantsViewModel.isLoading {
                    ZStack {
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    }
                } else {
                    restaurants
                }
                shopsSection
                if shopsViewModel.isLoading {
                    ZStack {
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    }
                } else {
                    shops
                }
                carsSection
                if carsToRentViewModel.isLoading {
                    ZStack {
                        Color(.white)
                            .opacity(0.3)
                            .ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    }
                } else {
                    carsToRent
                }
                blankText
            }
            .task {
                await eventsViewModel.fetchEvents()
                await restaurantsViewModel.fetchRestaurants()
                await shopsViewModel.fetchShops()
                await carsToRentViewModel.fetchCars()

            }
        }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView(carsToRentViewModel: .init(carsToRentService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/cars%2Fc1.jpeg?alt=media&token=edcc886f-0f1c-4d80-81ab-e8d7107c7252"), eventsViewModel: .init(eventService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/events%2Fevent1.png?alt=media&token=7dd8f611-0e9b-455f-bb5a-414c5a9d3b24"), restaurantsViewModel: .init(restaurantService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/restaurants%2Fmaui%20coffee.jpg?alt=media&token=95b1b6a2-b4a4-45a3-add1-9b3b12436e43"), shopsViewModel: .init(shopService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/shops%2Fala%20moana.png?alt=media&token=c6149ac7-6e44-4b38-84b0-a27724782e8a"))
    }
}

private extension DiscoveryView {
    
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
    
    var carsSection: some View {
        HStack {
            HStack {
                Image(systemName: "car.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.red)
                VStack {
                    HStack {
                        Text("Cars")
                            .font(.custom("Quicksand-Bold", size: 18))
                        Spacer()
                    }
                    HStack {
                        Text("42 Location")
                            .font(.custom("Quicksand-Regular", size: 13))
                        Spacer()
                    }
                }
            }
            Spacer()
            Button {
                //action
            } label: {
                Text("See More")
                    .font(.custom("Quicksand-Regular", size: 13))
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
    
    var carsToRent: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(carsToRentViewModel.carsToRent, id: \.id) {
                    randomCar in
                    VStack {
                        WebImage(url: URL(string: randomCar.image))
                            .resizable()
                            .cornerRadius(10)
                            .frame(height: 80)
                            .frame(maxWidth: .infinity)
                            .scaledToFill()
                            .padding(.horizontal, 5)
                        HStack {
                            Text(randomCar.price)
                                .font(.custom("Quicksand-Regular", size: 15))
                            Spacer()
                        }
                        HStack {
                            Text(randomCar.type)
                                .font(.custom("Quicksand-Bold", size: 15))
                            Spacer()
                        }
                        HStack {
                            Text(randomCar.adults + ", " + randomCar.bags)
                                .font(.custom("Quicksand-Regular", size: 15))
                            Spacer()
                        }
                        HStack {
                            Button {
                                //actions
                            } label: {
                                Text("View Deal")
                                    .font(.custom("Quicksand-Bold", size: 13))
                                    .foregroundColor(.white)
                                    .padding(7)
                                    .background(.green)
                                    .cornerRadius(10)
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 150, height: 200)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                }
            }
            
        }
        .padding(.horizontal)
        .scrollIndicators(SwiftUI.ScrollIndicatorVisibility.hidden)
    }
    
    var eventsSection: some View {
        HStack {
            HStack {
                Image(systemName: "calendar.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.green)
                VStack {
                    HStack {
                        Text("Events")
                            .font(.custom("Quicksand-Bold", size: 18))
                        Spacer()
                    }
                    HStack {
                        Text("30 Location")
                            .font(.custom("Quicksand-Regular", size: 13))
                        Spacer()
                    }
                }
            }
            Spacer()
            Button {
                //action
            } label: {
                Text("See More")
                    .font(.custom("Quicksand-Regular", size: 13))
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
    
    var events: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(eventsViewModel.events, id: \.id) { randomEvent in
                    ZStack {
                        WebImage(url: URL(string: randomEvent.image))
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(15)
                            .scaledToFill()
                        VStack {
                            Spacer()
                            HStack {
                                Text(randomEvent.name)
                                    .font(.custom("Quicksand-Bold", size: 16))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(ScrollIndicatorVisibility.never)
    }
    
    var restaurantsSection: some View {
        HStack {
            HStack {
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.yellow)
                VStack {
                    HStack {
                        Text("Restaurants")
                            .font(.custom("Quicksand-Bold", size: 18))
                        Spacer()
                    }
                    HStack {
                        Text("60 Location")
                            .font(.custom("Quicksand-Regular", size: 13))
                        Spacer()
                    }
                }
            }
            Spacer()
            Button {
                //action
            } label: {
                Text("See More")
                    .font(.custom("Quicksand-Regular", size: 13))
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
    
    var restaurants: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(restaurantsViewModel.restaurants, id: \.id) { randomRestaurant in
                    ZStack {
                        WebImage(url: URL(string: randomRestaurant.image))
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(15)
                            .scaledToFit()
                        VStack {
                            Spacer()
                            HStack {
                                Text(randomRestaurant.name)
                                    .font(.custom("Quicksand-Bold", size: 16))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(ScrollIndicatorVisibility.never)
    }
    
    var shopsSection: some View {
        HStack {
            HStack {
                Image(systemName: "cart.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.mint)
                VStack {
                    HStack {
                        Text("Shops")
                            .font(.custom("Quicksand-Bold", size: 18))
                        Spacer()
                    }
                    HStack {
                        Text("60 Location")
                            .font(.custom("Quicksand-Regular", size: 13))
                        Spacer()
                    }
                }
            }
            Spacer()
            Button {
                //action
            } label: {
                Text("See More")
                    .font(.custom("Quicksand-Regular", size: 13))
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
    
    var shops: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(shopsViewModel.shops, id: \.id) { randomShop in
                    ZStack {
                        WebImage(url: URL(string: randomShop.image))
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(15)
                            .scaledToFill()
                        VStack {
                            Spacer()
                            HStack {
                                Text(randomShop.name)
                                    .font(.custom("Quicksand-Bold", size: 16))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(ScrollIndicatorVisibility.never)
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
