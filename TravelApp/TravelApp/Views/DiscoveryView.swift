//
//  DiscoveryView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 04/05/2023.
//

import SwiftUI

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
                events
                restaurantsSection
                restaurants
                shopsSection
                shops
                carsSection
                carsToRent
                blankText
            }
            .onAppear {
                carsToRentViewModel.fetchCars()
                eventsViewModel.fetchEvents()
                restaurantsViewModel.fetchRestaurants()
                shopsViewModel.fetchShops()
            }
        }
    }
}

struct DiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryView(carsToRentViewModel: .init(carsToRentService: .init()), eventsViewModel: .init(eventService: .init()), restaurantsViewModel: .init(restaurantService: .init()), shopsViewModel: .init(shopService: .init()))
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
                        Image(randomCar.image)
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
                        Image(randomEvent.image)
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
                        Image(randomRestaurant.image)
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
                        Image(randomShop.image)
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
