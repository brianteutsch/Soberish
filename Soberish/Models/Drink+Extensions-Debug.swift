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

    static var previewBeer12: Drink {
        let name = "Tallboy"
        let volume = Measurement<UnitVolume>(value: 16, unit: .fluidOunces)
        let alcoholPercentage = 0.087
        let start = Date()
        let end = start + (30 * 60)
        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)

        return drink
    }

    static var previewBeer16: Drink {
        let name = "Beer"
        let volume = Measurement<UnitVolume>(value: 12, unit: .fluidOunces)
        let alcoholPercentage = 0.052
        let start = Date()
        let end = start + (30 * 60)
        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)

        return drink
    }

    static var previewWine: Drink {
        let name = "Wine"
        let volume = Measurement<UnitVolume>(value: 5, unit: .fluidOunces)
        let alcoholPercentage = 0.135
        let start = Date()
        let end = start + (30 * 60)
        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)

        return drink
    }

    static var previewCocktail: Drink {
        let name = "Cocktail"
        let volume = Measurement<UnitVolume>(value: 3.5, unit: .fluidOunces)
        let alcoholPercentage = 0.35
        let start = Date()
        let end = start + (30 * 60)
        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)

        return drink
    }

    static var previewShot: Drink {
        let name = "Shot"
        let volume = Measurement<UnitVolume>(value: 1.25, unit: .fluidOunces)
        let alcoholPercentage = 0.8
        let start = Date()
        let end = start + (30 * 60)
        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)

        return drink
    }

    static var previewDrinks: [Drink] {
        var drinks = [Drink]()

        drinks.append(Drink.previewBeer12)
        drinks.append(Drink.previewBeer16)
        drinks.append(Drink.previewWine)
        drinks.append(Drink.previewCocktail)
        drinks.append(Drink.previewShot)

        return drinks
    }
}
#endif
