//
//  Drink+Extensions-Debug.swift
//  Soberish
//
//  Created by Brian Teutsch on 11/2/26.
//

import Foundation
import SwiftData

#if DEBUG
extension Drink {
    static var preview: Drink {
        let drinkNames = [
            "Beer",
            "Cocktail",
            "Wine",
            "Champagne",
        ]

        let name = drinkNames[Int.random(in: 0...(drinkNames.count - 1))]

        let volumes = [
            3.0,
            6.0,
            12.0,
            16.0,
        ]
        let volumeValue = volumes[Int.random(in: 0...(volumes.count - 1))]
        let units: [UnitVolume] = [
            .fluidOunces,
            .milliliters,
        ]
        let unit = units[Int.random(in: 0...(units.count - 1))]
        let volume = Measurement<UnitVolume>(value: volumeValue, unit: unit)

        let alcoholPercentage = Double.random(in: 0.01...0.9)
        let start = Date()
        let minutes = Int.random(in: 1...60)
        let seconds = minutes * 60
        let end = Date() + TimeInterval(seconds)

        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)
        return drink
    }
}
#endif
