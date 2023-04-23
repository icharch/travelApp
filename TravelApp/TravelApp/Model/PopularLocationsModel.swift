//
//  PopularLocationsModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 22/04/2023.
//

import Foundation


struct PopularLocationModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

