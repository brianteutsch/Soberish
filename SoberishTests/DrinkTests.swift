//
//  DrinkTests.swift
//  DrinkTests
//
//  Created by Brian Teutsch on 11/3/26.
//

import Foundation
import SwiftData
import Testing

@testable import Soberish

struct DrinkTests {
    nonisolated let modelContainer: ModelContainer
    nonisolated let modelExecutor: any ModelExecutor

    let nameDefault = "A Drink"
    let volumeDefault = Measurement<UnitVolume>(value: 12.0, unit: UnitVolume.fluidOunces)
    let alcoholPercentageDefault = 0.05
    let startDefault = Date()
    let endDefault = Date() + (30 * 60)

    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        self.modelContainer = try ModelContainer(for: Drink.self, configurations: config)
        let context = ModelContext(modelContainer)
        self.modelExecutor = DefaultSerialModelExecutor(modelContext: context)
    }

    @Test func testDrink() async throws {
        _ = Drink(name: nameDefault,
                          volume: volumeDefault,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)
    }

    @Test func testDrinkName() async throws {
        let drink = Drink(name: nameDefault,
                          volume: volumeDefault,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)

        #expect(drink.name == nameDefault)

        let nameUpdated = nameDefault + " More String"
        drink.name = nameUpdated
        #expect(drink.name == nameUpdated)
    }

    @Test func testDrinkVolume() async throws {
        let drink = Drink(name: nameDefault,
                          volume: volumeDefault,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)

        #expect(drink.volume == volumeDefault)

        let volumeUpdated = Measurement<UnitVolume>(value: volumeDefault.value + 1.0, unit: volumeDefault.unit)
        drink.volume = volumeUpdated
        #expect(drink.volume == volumeUpdated)

    }

    @Test func testDrinkVolumeUnits() async throws {
        let volumeDecilieters = Measurement<UnitVolume>(value: 1.0, unit: .deciliters)
        let drinkDecilieters = Drink(name: nameDefault,
                          volume: volumeDecilieters,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)

        #expect(drinkDecilieters.volume == volumeDecilieters)

        let volumeCentiliters = Measurement<UnitVolume>(value: 1.0, unit: .centiliters)
        let drinkCentiliters = Drink(name: nameDefault,
                          volume: volumeCentiliters,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)
        #expect(drinkCentiliters.volume == volumeCentiliters)

        let volumeMilliliters = Measurement<UnitVolume>(value: 1.0, unit: .milliliters)
        let drinkMilliliters = Drink(name: nameDefault,
                          volume: volumeMilliliters,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)
        #expect(drinkMilliliters.volume == volumeMilliliters)

        let volumeLiters = Measurement<UnitVolume>(value: 1.0, unit: .liters)
        let drinkLiters = Drink(name: nameDefault,
                          volume: volumeLiters,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)
        #expect(drinkLiters.volume == volumeLiters)

        let volumeFluidOunces = Measurement<UnitVolume>(value: 1.0, unit: .liters)
        let drinkFluidOunces = Drink(name: nameDefault,
                          volume: volumeFluidOunces,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)
        #expect(drinkFluidOunces.volume == volumeFluidOunces)

        let volumeMegaliters = Measurement<UnitVolume>(value: 1.0, unit: .megaliters)
        let drinkMegaliters = Drink(name: nameDefault,
                          volume: volumeMegaliters,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)
        #expect(drinkMegaliters.volume == nil)
    }

    @Test func testDrinkAlcoholPercentage() async throws {
        let drink = Drink(name: nameDefault,
                          volume: volumeDefault,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)

        #expect(drink.alcoholPercentage == alcoholPercentageDefault)

        let alcoholPercentageUpdated = alcoholPercentageDefault + 0.01
        drink.alcoholPercentage = alcoholPercentageUpdated
        #expect(drink.alcoholPercentage == alcoholPercentageUpdated)
    }

    @Test func testDrinkAlcohol() async throws {
        let drink = Drink(name: nameDefault,
                          volume: volumeDefault,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)

        let alcoholValue: Measurement<UnitVolume> = try #require(drink.alcohol)
        #expect(alcoholValue.value > 0)
    }

    @Test func testDrinkStartEnd() async throws {
        let drink = Drink(name: nameDefault,
                          volume: volumeDefault,
                          alcoholPercentage: alcoholPercentageDefault,
                          start: startDefault,
                          end: endDefault)

        #expect(drink.start == startDefault)

        let startUpdated = startDefault.addingTimeInterval(1)
        drink.start = startUpdated
        #expect(drink.start == startUpdated)

        let endUpdated = endDefault.addingTimeInterval(1)
        drink.end = endUpdated
        #expect(drink.end == endUpdated)
    }
}
