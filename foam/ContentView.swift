//
//  ContentView.swift
//  foam
//
//  Created by austin_wood on 2/21/21.
//

import SwiftUI

struct ContentView: View {
    static let coffees: [Coffee] = Bundle.main.decode("coffees.json")

    var body: some View {
        NavigationView {
            List(Self.coffees) { coffee in
                NavigationLink(destination: CoffeeDetailView(coffee: coffee),
                               label: { Text(coffee.name) })
            }
            .navigationBarTitle("foam")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
