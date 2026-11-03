//
//  Drink.swift
//  Soberish
//
//  Created by Brian Teutsch on 11/2/26.
//

import Foundation
import SwiftData

@Model
public class Drink {
    public var name: String
    var volumeValue: Double?
    var volumeUnit: String?
    public var alcoholPercentage: Double?
    public var start: Date
    public var end: Date

    public init(name: String = "",
                volume: Measurement<UnitVolume>,
                alcoholPercentage: Double,
                start: Date,
                end: Date) {
        self.name = name
        self.alcoholPercentage = alcoholPercentage
        self.start = start
        self.end = end

        self.volume = volume
    }

    public var volume: Measurement<UnitVolume>? {
        get {
            guard let value = self.volumeValue, let unitString = self.volumeUnit else { return nil }
            guard let unit = self.decodeUnitVolume(unitString) else { return nil }

            let volume = Measurement<UnitVolume>(value: value, unit: unit)
            return volume
        }

        set {
            guard let newValue else {
                self.volumeValue = nil
                self.volumeUnit = nil
                return
            }

            self.volumeValue = newValue.value
            self.volumeUnit = encodeUnitVolume(newValue.unit)
        }
    }

    func encodeUnitVolume(_ unitVolume: UnitVolume) -> String {
        return unitVolume.symbol
    }

    func decodeUnitVolume(_ name: String) -> UnitVolume? {

        // Use methodName from the Apple documentation table for UnitVolume
        // https://developer.apple.com/documentation/foundation/unitvolume
        //
        // In practice, only measurement unites specified in the user interface are required to be supported.
        // ounces, milliliters, centiliters, and liters

        switch name {
        case "dL":
            return .deciliters
        case "cL":
            return .centiliters
        case "mL":
            return .milliliters
        case "L":
            return .liters
        case "fl oz":
            return .fluidOunces
        default:
            return nil
        }
    }
}

extension Drink {
    public var alcohol: Measurement<UnitVolume>? {
        guard let volume  = self.volume, let alcoholPercentage = self.alcoholPercentage else { return nil }
        return volume * alcoholPercentage
    }
}

extension Drink: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
            Name: \(self.name)
            Volume: \(String(describing: self.volume))
            Alcohol: \(String(describing: self.alcohol))
            Drink Start: \(self.start)
            Drink End: \(self.end)
            """

    }
}
