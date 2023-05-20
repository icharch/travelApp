//
//  RestaurantsModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

struct RestaurantsModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
