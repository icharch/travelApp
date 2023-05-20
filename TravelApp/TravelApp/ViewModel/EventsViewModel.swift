//
//  EventsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class EventsViewModel: ObservableObject {
    
    private var eventService: EventsService
    
    init(eventService: EventsService) {
        self.eventService = eventService
    }
    
    @Published var events: [EventsModel] = []
    
    func fetchEvents() {
        events = eventService.getEvents()
    }
    
}
