//
//  RestaurantsService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation
import FirebaseFirestore

class RestaurantsService {
    private var databaseReference = Firestore.firestore()

    func getRestaurants() async throws -> [RestaurantsModel] {
        let snapshot = try await databaseReference.collection("restaurants").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: RestaurantsModel.self) }
    }
}

