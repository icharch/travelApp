//
//  EventsView.swift
//  TravelApp
//
//  Created by Irmina Charchuta on 12/05/2023.
//

import SwiftUI

struct EventsView: View {
    
    @State var enterSearch = ""
    
    var body: some View {
        ScrollView {
            VStack {
                searchText
            }
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}

private extension EventsView {
    var searchText: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Enter search", text: $enterSearch)
                .font(.custom("Quicksand-Regular", size: 16))
                .autocorrectionDisabled()
            Spacer()
        }
        .padding()
        .background(
            Color("SecondColor")
                .cornerRadius(15)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        .padding()
    }
}
