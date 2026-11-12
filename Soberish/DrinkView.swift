//
//  DrinkView.swift
//  Soberish
//
//  Created by Brian Teutsch on 11/2/26.
//

import SwiftUI
import SwiftData

struct DrinkView: View {
    @Bindable public var drink: Drink
    @Environment(\.editMode) private var editMode

    var formatter: MeasurementFormatter {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitOptions = .providedUnit
        measurementFormatter.unitStyle = .short
        return measurementFormatter
    }

    var body: some View {
        Form {
            if editMode?.wrappedValue.isEditing == true {
                TextField("Edit Drink Name", text: $drink.name)
            } else {
                Text("Name: \(drink.name)")
            }

            let volume = drink.volume ?? Measurement<UnitVolume>(value: 0.0, unit: .fluidOunces)
            HStack {
                Text("Volume: ")
                if editMode?.wrappedValue.isEditing == true {
                    TextField("", value: $drink.volumeValue, format: .number)
                                    .keyboardType(.decimalPad)
                } else {
                    Text(volume.value.description)
                }
                Text(volume.unit.symbol)
            }

            HStack {
                Text("ABV: ")
                if editMode?.wrappedValue.isEditing == true {
                    TextField("", value: $drink.alcoholPercentage, format: .number)
                        .keyboardType(.decimalPad)
                } else {
                    let alcoholPercentage = drink.alcoholPercentage ?? 0.0
                    Text("\(alcoholPercentage.formatted(.percent.precision(.fractionLength(1))))")
                }
            }

            let alcohol = drink.alcohol ?? Measurement<UnitVolume>(value: 0.0, unit: .fluidOunces)
            Text("Alcohol: \(formatter.string(from: alcohol))")
            Text("Start: \(drink.start.formatted(date: .long, time: .shortened))")
            Text("End: \(drink.end.formatted(date: .long, time: .shortened))")
        }
    }
}

#Preview {
    @Previewable @State var editMode: EditMode = .inactive

    NavigationStack {
        DrinkView(drink: .preview)
            .modelContainer(for: Drink.self, inMemory: true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .environment(\.editMode, $editMode)
    }
}
