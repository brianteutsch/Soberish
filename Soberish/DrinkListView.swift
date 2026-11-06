//
//  DrinkListView.swift
//  Soberish
//
//  Created by Brian Teutsch on 11/4/26.
//

import SwiftUI
import SwiftData

struct DrinkListView: View {
    @Query(sort: \Drink.start) private var drinks: [Drink]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationView {
            List {
                ForEach(drinks) { drink in
                    NavigationLink(drink.name) {
                        DrinkView(drink: drink)
                    }
                }
            }
        }
    }
}

#Preview {
    DrinkListView()
        .modelContainer(SampleData.shared.modelContainer)
}
