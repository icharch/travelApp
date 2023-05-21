//
//  EventsService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation
import FirebaseFirestore

class EventsService {
    
    private var databaseReference = Firestore.firestore()
    
    func getEvents() async throws -> [EventsModel] {
        let snapshot = try await databaseReference.collection("events").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: EventsModel.self) }
    }
}
