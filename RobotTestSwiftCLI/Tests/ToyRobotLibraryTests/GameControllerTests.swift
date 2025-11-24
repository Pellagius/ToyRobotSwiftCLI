//
//  GameControllerTests.swift
//  RobotTestSwiftCLI
//
//  Created by David Wright on 24/11/2025.
//

import Testing
@testable import ToyRobotLibrary

struct GameControllerTests {

    @Test
    func testPlacementFlowCreatesRobot() {
        let controller = GameController()
        let commands = ["PLACE", "1", "2", "NORTH"]

        // Simulate placement handler behavior
        let placement = controller.placementHandler.handlePlacement(commands)

        #expect(placement.count == 4)
        #expect(placement[1] == "1")
        #expect(placement[2] == "2")
        #expect(placement[3].lowercased() == "north")
    }

    @Test
    func testMovementFlowAfterPlacement() {
        let controller = GameController()

        let robot = Robot(position: [0,0], facing: .north)

        let movementCommands = ["MOVE", "MOVE", "LEFT"]
        let result = controller.movementHandler.handleMovement(movementCommands, robot)

        #expect(result.isEmpty)  // No report command
        #expect(robot.position == [0,2])
        #expect(robot.facing == .west)
    }
}
