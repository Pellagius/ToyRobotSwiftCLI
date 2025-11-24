//
//  PlacementHandlerTests.swift
//  RobotTestSwiftCLI
//
//  Created by David Wright on 24/11/2025.
//

import Testing
@testable import ToyRobotLibrary

struct PlacementHandlerTests {

    @Test
    func testValidPlacement() {
        let handler = PlacementHandler()

        let commands = ["PLACE", "2", "3", "NORTH"]
        let output = handler.handlePlacement(commands)

        #expect(output.count == 4)
        #expect(output[1] == "2")
        #expect(output[2] == "3")
        #expect(output[3].lowercased() == "north")
    }

    @Test
    func testInvalidPosition() {
        let handler = PlacementHandler()

        let commands = ["PLACE", "-1", "20", "EAST"]
        let output = handler.handlePlacement(commands)

        #expect(output.isEmpty)
    }

    @Test
    func testInvalidFacing() {
        let handler = PlacementHandler()

        let commands = ["PLACE", "1", "1", "UPWARD"]
        let output = handler.handlePlacement(commands)

        #expect(output.isEmpty)
    }

    @Test
    func testFindsLastPlacementCommand() {
        let handler = PlacementHandler()

        let commands = ["MOVE", "MOVE", "PLACE", "1", "1", "N", "MOVE", "PLACE", "3", "4", "S"]
        let output = handler.handlePlacement(commands)

        #expect(output[1] == "3")
        #expect(output[2] == "4")
        #expect(output[3].lowercased() == "s")
    }

    @Test
    func testShortFormP() {
        let handler = PlacementHandler()

        let commands = ["p", "2", "2", "w"]
        let output = handler.handlePlacement(commands)

        #expect(!output.isEmpty)
        #expect(output[1] == "2")
        #expect(output[2] == "2")
        #expect(output[3].lowercased() == "w")
    }
}
