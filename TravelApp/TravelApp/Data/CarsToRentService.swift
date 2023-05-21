//
//  CarsToRentService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 10/05/2023.
//

import Foundation
import FirebaseFirestore

class CarsToRentService {

    private var databaseReference = Firestore.firestore()

    func getCarsToRent() async throws -> [CarsToRentModel] {
        let snapshot = try await databaseReference.collection("cars").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: CarsToRentModel.self) }
    }
    
}

