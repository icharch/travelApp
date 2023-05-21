//
//  ShopsViewModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 11/05/2023.
//

import Foundation

class ShopsViewModel: ObservableObject {
    
    private var shopService: ShopsService
    @Published var photoURL: URL?
    
    init(shopService: ShopsService, photoURL: String) {
        self.shopService = shopService
        self.photoURL = URL(string: photoURL)
    }
    
    @Published var shops: [ShopsModel] = []
    @Published var isLoading: Bool = false
    
    @MainActor
    func fetchShops() async {
        isLoading = true
        do {
            shops = try await shopService.getShops()
            isLoading = false
        } catch {
            //todo handle error
        }
    }
}
