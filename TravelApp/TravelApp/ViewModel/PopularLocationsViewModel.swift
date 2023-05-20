//
//  PopularLocationsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 23/04/2023.
//

import Foundation

class PopularLocationsViewModel: ObservableObject {
    
    private var locationService: LocationService
    
    init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    @Published var popularLocations: [PopularLocationModel]  = []
    @Published var recentLocations: [RecentLocationsModel] = []
    
    func fetchData() {
        popularLocations = locationService.getPopularLocations()
        recentLocations = locationService.getRecentLocations()
    }
}
