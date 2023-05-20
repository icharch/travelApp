//
//  PopularLocationsModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 22/04/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct PopularLocationModel: Identifiable, Hashable, Decodable {


    let id = UUID()
    let name: String
    let image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}


struct PopularLocation: Identifiable, Hashable, Codable {
    @DocumentID var id: String? // @DocumentID to fetch the identifier from Firestore
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
