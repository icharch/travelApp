//
//  ShopsService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation
import FirebaseFirestore

class ShopsService {
    
    private var databaseReference = Firestore.firestore()

    func getShops() async throws -> [ShopsModel] {
        let snapshot = try await databaseReference.collection("shops").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: ShopsModel.self) }
    }
}
