//
//  ShopsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class ShopsViewModel: ObservableObject {
    
    private var shopService: ShopsService
    
    init(shopService: ShopsService) {
        self.shopService = shopService
    }
    
    @Published var shops: [ShopsModel] = []
    
    func fetchShops() {
        shops = shopService.getShops()
    }
}
