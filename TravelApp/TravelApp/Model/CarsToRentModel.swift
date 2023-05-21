//
//  CarsToRentModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 10/05/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct CarsToRentModel: Identifiable, Hashable, Decodable {
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

struct CarsToRent: Identifiable, Hashable, Decodable {
    @DocumentID var id: String? // @DocumentID to fetch the identifier from Firestore
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
