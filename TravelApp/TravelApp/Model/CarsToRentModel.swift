//
//  CarsToRentModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 10/05/2023.
//

import Foundation

struct CarsToRentModel: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let price: String
    let type: String
    let adults: String
    let bags: String
    
    init(image: String, price: String, type: String, adults: String, bags: String) {
        self.image = image
        self.price = price
        self.type = type
        self.adults = adults
        self.bags = bags
    }
}
