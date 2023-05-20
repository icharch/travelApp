//
//  EventsService.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation


class EventsService {
    func getEvents() -> [EventsModel] {
        return [
        EventsModel(name: "Turtle Canyon", image: "event3"),
        EventsModel(name: "LAB", image: "event2"),
        EventsModel(name: "Pearl Harbor", image: "event4"),
        EventsModel(name: "Show Cruise", image: "event5"),
        EventsModel(name: "Summit Sunset", image: "event6"),
        EventsModel(name: "Jessie Reyez", image: "event1")
        ]
    }
}
