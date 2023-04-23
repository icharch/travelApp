//
//  LocationService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 23/04/2023.
//

import Foundation

class LocationService {
    func getPopularLocations() -> [PopularLocationModel] {
        return [
        PopularLocationModel(name: "Hawai'i", image: "hawai"),
        PopularLocationModel(name: "Kauai", image: "kauai"),
        PopularLocationModel(name: "Maui", image: "maui"),
        PopularLocationModel(name: "O'ahu", image: "oahu"),
        PopularLocationModel(name: "Lanai", image: "lanai"),
        PopularLocationModel(name: "Moloka'i", image: "molokai"),
        PopularLocationModel(name: "Ni'ihau", image: "niihau"),
        PopularLocationModel(name: "Kaho'olawe", image: "kahoolawe")
        ]
    }
}
