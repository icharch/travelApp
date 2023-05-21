//
//  RestaurantsModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct RestaurantsModel: Identifiable, Hashable, Decodable {
    let id = UUID()
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

struct Restaurants: Identifiable, Hashable, Codable {
    @DocumentID var id: String? // @DocumentID to fetch the identifier from Firestore
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
