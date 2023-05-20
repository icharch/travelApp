//
//  ShopsService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class ShopsService {
    func getShops() -> [ShopsModel] {
        return [
            ShopsModel(name: "Ala Moana", image: "ala moana"),
            ShopsModel(name: "Olivia Clare", image: "olivia clare"),
            ShopsModel(name: "Queens Market", image: "queens' marketplace"),
            ShopsModel(name: "HIC", image: "HIC"),
            ShopsModel(name: "Aloha Shirts", image: "aloha shirts"),
            ShopsModel(name: "Luxury Row", image: "luxury row")
        ]
    }
}
