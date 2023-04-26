//
//  TabBarItemModel.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 26/04/2023.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, discovery, account

    var iconName: String {
        switch self {
        case .home: return "house"
        case .discovery: return "mappin.and.ellipse"
        case .account: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .discovery: return "Discovery"
        case .account: return "Account"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.red
        case .discovery: return Color.green
        case .account: return Color.orange
        }
    }

}
