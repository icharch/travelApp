//
//  CarsToRentViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 10/05/2023.
//

import Foundation

class CarsToRentViewModel: ObservableObject {
    
    private var carsToRentService: CarsToRentService
    
    init(carsToRentService: CarsToRentService) {
        self.carsToRentService = carsToRentService
    }
    
    @Published var carsToRent: [CarsToRentModel] = []
    
    func fetchCars() {
        carsToRent = carsToRentService.getCarsToRent()
    }
}
