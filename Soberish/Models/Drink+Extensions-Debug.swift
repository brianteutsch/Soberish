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
    static let preview: Drink = {
        let drinkNames = [
            "Beer",
            "Cocktail",
            "Wine",
            "Champagne",
        ]

        let name = drinkNames[Int.random(in: 0...(drinkNames.count - 1))]
        let volume = Measurement<UnitVolume>(value: 12.0, unit: .fluidOunces)
        let alcoholPercentage = 0.05
        let start = Date()
        let end = Date() + (30 * 60)

        let drink = Drink(name: name, volume: volume, alcoholPercentage: alcoholPercentage, start: start, end: end)
        return drink
    }()
}
#endif
