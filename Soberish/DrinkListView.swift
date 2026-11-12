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
    @State var editMode: EditMode = .inactive

    var body: some View {
        List {
            ForEach(drinks) { drink in
                NavigationLink(drink.name) {
                    DrinkView(drink: drink)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                EditButton()
                            }
                        }
                        .environment(\.editMode, $editMode)
                }
            }
        }
    }
}

#Preview {
    let sampleData = SampleData.shared
//    sampleData.addSampleData()
    NavigationStack {
        DrinkListView()
            .modelContainer(sampleData.modelContainer)
    }
}
