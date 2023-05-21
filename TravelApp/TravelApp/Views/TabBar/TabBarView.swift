//
//  TabBarView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 25/04/2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            
            HomeView(popularLocationsViewModel: PopularLocationsViewModel(locationService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/kahoolawe.jpg?alt=media&token=a2142070-3e8b-4792-9f5b-71bc08ee80b5"))
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            DiscoveryView(carsToRentViewModel: .init(carsToRentService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/cars%2Fc1.jpeg?alt=media&token=edcc886f-0f1c-4d80-81ab-e8d7107c7252"), eventsViewModel: .init(eventService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/events%2Fevent1.png?alt=media&token=7dd8f611-0e9b-455f-bb5a-414c5a9d3b24"), restaurantsViewModel: .init(restaurantService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/restaurants%2Fmaui%20coffee.jpg?alt=media&token=95b1b6a2-b4a4-45a3-add1-9b3b12436e43"), shopsViewModel: .init(shopService: .init(), photoURL: "https://firebasestorage.googleapis.com/v0/b/travel-app-e37ec.appspot.com/o/shops%2Fala%20moana.png?alt=media&token=c6149ac7-6e44-4b38-84b0-a27724782e8a"))
                .tabBarItem(tab: .discovery, selection: $tabSelection)
            
            SignInView()
                .tabBarItem(tab: .account, selection: $tabSelection)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Spacer()
            TabBarView()
        }
    }
}

private extension TabBarView {
    var tabView: some View {
        TabView(selection: $selection) {
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Discovery")
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Discovery")
                }
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
    }
}
