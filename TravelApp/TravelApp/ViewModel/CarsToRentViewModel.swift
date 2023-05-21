//
//  CarsToRentViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 10/05/2023.
//

import Foundation

class CarsToRentViewModel: ObservableObject {
    
    private var carsToRentService: CarsToRentService
    @Published var photoURL: URL?
    
    init(carsToRentService: CarsToRentService, photoURL: String) {
        self.carsToRentService = carsToRentService
        self.photoURL = URL(string: photoURL)
    }
    
    @Published var carsToRent: [CarsToRentModel] = []
    @Published var isLoading: Bool = false
    
    @MainActor
    func fetchCars() async {
        isLoading = true
        do {
            carsToRent = try await carsToRentService.getCarsToRent()
            isLoading = false
        } catch {
            //todo handle error
        }
    }
}
