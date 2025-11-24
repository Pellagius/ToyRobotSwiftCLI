//
//  HelpersTests.swift
//  RobotTestSwiftCLI
//
//  Created by David Wright on 24/11/2025.
//


import Testing
@testable import ToyRobotLibrary

struct HelpersTests {

    @Test
    func testProcessCommandStringSplitsOnSpaces() {
        let input = "MOVE LEFT RIGHT"
        let output = Helpers.processCommandString(input)

        #expect(output == ["MOVE", "LEFT", "RIGHT"])
    }

    @Test
    func testProcessCommandStringSplitsOnCommas() {
        let input = "PLACE,1,2,NORTH"
        let output = Helpers.processCommandString(input)

        #expect(output == ["PLACE", "1", "2", "NORTH"])
    }

    @Test
    func testProcessCommandStringSplitsOnSemicolons() {
        let input = "MOVE;LEFT;REPORT"
        let output = Helpers.processCommandString(input)

        #expect(output == ["MOVE", "LEFT", "REPORT"])
    }

    @Test
    func testProcessCommandStringHandlesMixedDelimiters() {
        let input = "PLACE 1,2;NORTH MOVE"
        let output = Helpers.processCommandString(input)

        #expect(output == ["PLACE", "1", "2", "NORTH", "MOVE"])
    }

    @Test
    func testProcessCommandStringIgnoresEmptyValues() {
        let input = "MOVE,, , LEFT"
        let output = Helpers.processCommandString(input)

        #expect(output == ["MOVE", "LEFT"])
    }

    @Test
    func testSafeSubscriptWithinBounds() {
        let arr = ["A", "B", "C"]

        let result = arr[safe: 1]

        #expect(result == "B")
    }

    @Test
    func testSafeSubscriptOutOfLowerBounds() {
        let arr = ["A", "B", "C"]

        let result = arr[safe: -1]

        #expect(result == nil)
    }

    @Test
    func testSafeSubscriptOutOfUpperBounds() {
        let arr = ["A", "B", "C"]

        let result = arr[safe: 10]

        #expect(result == nil)
    }

    @Test
    func testSafeSubscriptOnEmptyArray() {
        let arr: [Int] = []

        let result = arr[safe: 0]

        #expect(result == nil)
    }

    @Test
    func testSafeSubscriptReturnsCorrectType() {
        let arr = [10, 20, 30]

        let result = arr[safe: 2]

        #expect(result == 30)
    }
}
