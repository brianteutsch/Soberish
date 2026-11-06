//
//  SampleData-Debug.swift
//  Soberish
//
//  Created by Brian Teutsch on 11/4/26.
//

import Foundation
import SwiftData

#if DEBUG
class SampleData {
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    private init() {
        let schema = Schema([
            Drink.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])

            insertSampleData()

            try context.save()
        } catch {
            // swiftlint:disable:next fatal_error
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    private func insertSampleData() {
        for _ in 1...10 {
            let previewDrinks = Drink.previewDrinks
            let drink = previewDrinks[Int.random(in: 0...(previewDrinks.count - 1))]
            self.context.insert(drink)
        }
    }
}
#endif
