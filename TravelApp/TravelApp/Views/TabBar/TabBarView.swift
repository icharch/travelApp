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
            
            DiscoveryView(carsToRentViewModel: .init(carsToRentService: .init()), eventsViewModel: .init(eventService: .init()), restaurantsViewModel: .init(restaurantService: .init()), shopsViewModel: .init(shopService: .init()))
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
