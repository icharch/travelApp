//
//  RestaurantsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class RestaurantsViewModel: ObservableObject {
    
    private var restaurantService: RestaurantsService
    @Published var photoURL: URL?
    
    init(restaurantService: RestaurantsService, photoURL: String) {
        self.restaurantService = restaurantService
        self.photoURL = URL(string: photoURL)
    }
    
    @Published var restaurants: [RestaurantsModel] = []
    @Published var isLoading: Bool = false
    
    @MainActor
    func fetchRestaurants() async {
        isLoading = true
        do {
            restaurants = try await restaurantService.getRestaurants()
            isLoading = false
        }
        catch {
            //todo handle error
        }
    }
}
