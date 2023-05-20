//
//  RestaurantsService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class RestaurantsService {
    func getRestaurants() -> [RestaurantsModel] {
        return [
        RestaurantsModel(name: "Maui Coffee", image: "maui coffee"),
        RestaurantsModel(name: "Cafe Pesto", image: "cafe pesto"),
        RestaurantsModel(name: "Tommy Bahama", image: "tommy"),
        RestaurantsModel(name: "Porky's Kauai", image: "porky-s-kauai"),
        RestaurantsModel(name: "Crispy Calamari", image: "images-4"),
        RestaurantsModel(name: "Over Easy", image: "over easy2"),
        ]
    }
}

