//
//  MovementHandlerTests.swift
//  RobotTestSwiftCLI
//
//  Created by David Wright on 24/11/2025.
//

import Testing
@testable import ToyRobotLibrary

struct MovementHandlerTests {

    @Test
    func testMoveNorth() {
        let robot = Robot(position: [0,0], facing: .north)
        let handler = MovementHandler()

        let _ = handler.handleMovement(["MOVE"], robot)

        #expect(robot.position == [0,1])
    }

    @Test
    func testMoveBlockedAtTableEdge() {
        let robot = Robot(position: [0,5], facing: .north)
        let handler = MovementHandler()

        let _ = handler.handleMovement(["MOVE"], robot)

        #expect(robot.position == [0,5])
    }

    @Test
    func testTurnLeft() {
        let robot = Robot(position: [0,0], facing: .north)
        let handler = MovementHandler()

        let _ = handler.handleMovement(["LEFT"], robot)

        #expect(robot.facing == .west)
    }

    @Test
    func testTurnRight() {
        let robot = Robot(position: [0,0], facing: .north)
        let handler = MovementHandler()

        let _ = handler.handleMovement(["RIGHT"], robot)

        #expect(robot.facing == .east)
    }

    @Test
    func testReportGeneratesOutput() {
        let robot = Robot(position: [2,3], facing: .south)
        let handler = MovementHandler()

        let report = handler.handleMovement(["REPORT"], robot)

        #expect(report.contains("2"))
        #expect(report.contains("3"))
        #expect(report.lowercased().contains("south"))
    }

    @Test
    func testShortFormCommands() {
        let robot = Robot(position: [1,1], facing: .east)
        let handler = MovementHandler()

        let _ = handler.handleMovement(["m", "l", "r"], robot)

        #expect(robot.position == [2,1])
        #expect(robot.facing == .east) // net effect: L then R = no rotation
    }
}
