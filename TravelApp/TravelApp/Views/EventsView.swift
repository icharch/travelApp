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
            VStack(spacing: 30) {
                searchText
                VStack(spacing: 15) {
                    activity
                    concert
                    sightseeing
                }
                blankText
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
        .padding(.horizontal)
    }
    
    var activity: some View {
        ZStack {
            Image("activity")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Activity")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var concert: some View {
        ZStack {
            Image("concerts")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Concert")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var sightseeing: some View {
        ZStack {
            Image("sightseeing")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(15)
            VStack {
                Spacer()
                HStack {
                    Text("Sightseeing")
                        .font(.custom("Quicksand-Bold", size: 22))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
    
    var blankText: some View {
        VStack {
            Text("")
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}
