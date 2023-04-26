//
//  RecentLocationsModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 24/04/2023.
//

import Foundation

struct RecentLocationsModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    let cuisine: String
    let starRate: Double
    let rate: String
    
    init(name: String, image: String, cuisine: String, starRate: Double, rate: String) {
        self.name = name
        self.image = image
        self.cuisine = cuisine
        self.starRate = starRate
        self.rate = rate
    }
}
