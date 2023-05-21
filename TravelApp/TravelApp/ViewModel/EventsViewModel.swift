//
//  EventsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class EventsViewModel: ObservableObject {
    
    private var eventService: EventsService
    @Published var photoURL: URL?
    
    init(eventService: EventsService, photoURL: String) {
        self.eventService = eventService
        self.photoURL = URL(string: photoURL)
    }
    
    @Published var events: [EventsModel] = []
    @Published var isLoading: Bool = false
    
    @MainActor
    func fetchEvents() async {
        isLoading = true
        do {
            events = try await eventService.getEvents()
            isLoading = false
        } catch { //todo handle error
        }
    }
}
