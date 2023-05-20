//
//  CarsToRentService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 10/05/2023.
//

import Foundation

class CarsToRentService {
    func getCarsToRent() -> [CarsToRentModel] {
        return [
            CarsToRentModel(image: "c1", price: "$22/day", type: "Economy", adults: "2 Adults", bags: "2 Bags"),
            CarsToRentModel(image: "c2", price: "$24/day", type: "Standard", adults: "5 Adults", bags: "3 Bags"),
            CarsToRentModel(image: "c3", price: "$33/day", type: "Full-size SUV", adults: "5 Adults", bags: "2 Bags"),
            CarsToRentModel(image: "c4", price: "$52/day", type: "Convertible", adults: "5 Adults", bags: "3 Bags"),
            CarsToRentModel(image: "c5", price: "$45/day", type: "Premium SUV", adults: "5 Adults", bags: "5 Bags"),
            CarsToRentModel(image: "c6", price: "$56/day", type: "Premium coupe", adults: "5 Adults", bags: "5 Bags")
            ]
    }
    
}

