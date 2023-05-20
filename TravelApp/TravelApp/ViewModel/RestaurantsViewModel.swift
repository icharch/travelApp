//
//  RestaurantsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class RestaurantsViewModel: ObservableObject {
    
    private var restaurantService: RestaurantsService
    
    init(restaurantService: RestaurantsService) {
        self.restaurantService = restaurantService
    }
    
    @Published var restaurants: [RestaurantsModel] = []
    
    func fetchRestaurants() {
        restaurants = restaurantService.getRestaurants()
    }
}
