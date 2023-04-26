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
            
            MainView(popularLocationsViewModel: PopularLocationsViewModel(locationService: .init()))
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.green.ignoresSafeArea()
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
