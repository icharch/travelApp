//
//  LocationService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 23/04/2023.
//

import Foundation
import FirebaseFirestore

class LocationService {
    private var databaseReference = Firestore.firestore()

    func getPopularLocations() async throws -> [PopularLocationModel] {
        let snapshot = try await databaseReference.collection("locations").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: PopularLocationModel.self) }
    }
    
    func getRecentLocations() -> [RecentLocationsModel] {
        return [
            RecentLocationsModel(name: "Maui Coffee Roasters", image: "maui coffee", type: "Coffeehouse", starRate: 3.2, rate: "3.2"),
            RecentLocationsModel(name: "Turtle Canyon", image: "event3", type: "Event", starRate: 3.9, rate: "3.9"),
            RecentLocationsModel(name: "Olivia Clare", image: "olivia clare", type: "Shop", starRate: 4.1, rate: "4.1"),
            RecentLocationsModel(name: "Cafe Pesto Hilo Bay", image: "cafe pesto", type: "Italian", starRate: 5.0, rate: "5.0"),
            RecentLocationsModel(name: "Luxury Row", image: "luxury row", type: "Shop", starRate: 2.8, rate: "2.8"),
            RecentLocationsModel(name: "Summit Sunset", image: "event6", type: "Event", starRate: 4.7, rate: "4.7"),
        ]
    }
}
