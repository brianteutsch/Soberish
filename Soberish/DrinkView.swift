//
//  DrinkView.swift
//  Soberish
//
//  Created by Brian Teutsch on 11/2/26.
//

import SwiftUI
import SwiftData

struct DrinkView: View {
    public var drink: Drink

    var formatter: MeasurementFormatter {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitOptions = .providedUnit
        measurementFormatter.unitStyle = .short
        return measurementFormatter
    }

    var body: some View {
        VStack {
            let name = drink.name
            Text("Name: \(name)")

            let volume = drink.volume ?? Measurement<UnitVolume>(value: 0.0, unit: .fluidOunces)
            Text("Volume: \(formatter.string(from: volume))")

            let alcoholPercentage = drink.alcoholPercentage ?? 0.0
            Text("ABV: \(alcoholPercentage.formatted(.percent.precision(.fractionLength(1))))")

            let alcohol = drink.alcohol ?? Measurement<UnitVolume>(value: 0.0, unit: .fluidOunces)
            Text("Alcohol: \(formatter.string(from: alcohol))")
            Text("Start: \(drink.start.formatted(date: .long, time: .shortened))")
            Text("End: \(drink.end.formatted(date: .long, time: .shortened))")
        }
    }
}

#Preview {
    DrinkView(drink: .preview)
        .modelContainer(for: Drink.self, inMemory: true)
}
