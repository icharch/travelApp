//
//  PopularLocationsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 23/04/2023.
//

import FirebaseFirestore
import Foundation

class PopularLocationsViewModel: ObservableObject {
    private var locationService: LocationService
    @Published var photoURL: URL?

    init(locationService: LocationService, photoURL: String) {
        self.locationService = locationService
        self.photoURL = URL(string: photoURL)
    }

    @Published var popularLocations: [PopularLocationModel] = []
    @Published var recentLocations: [RecentLocationsModel] = []
    @Published var isLoading: Bool = false
    
    @MainActor
    func fetchData() async {
        isLoading = true
        do {
            popularLocations = try await locationService.getPopularLocations()
            isLoading = false
        } catch {
            // todo handle error
        }
//        recentLocations = locationService.getRecentLocations()
    }
}
