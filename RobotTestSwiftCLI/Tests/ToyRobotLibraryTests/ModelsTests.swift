import Testing
@testable import ToyRobotLibrary

struct ModelsTests {
    
    // MARK: - isPlaced()
    
    @Test
    func testIsPlacedReturnsTrueWhenPositionAndFacingSet() {
        let robot = Robot(position: [1, 2], facing: .north)
        #expect(robot.isPlaced() == true)
    }
    
    @Test
    func testIsPlacedReturnsFalseWhenPositionEmpty() {
        let robot = Robot(position: [], facing: .north)
        #expect(robot.isPlaced() == false)
    }
    
    @Test
    func testIsPlacedReturnsFalseWhenFacingNone() {
        let robot = Robot(position: [1, 2], facing: .none)
        #expect(robot.isPlaced() == false)
    }
    
    // MARK: - report()
    
    @Test
    func testReportReturnsEmptyWhenNotPlaced() {
        let robot = Robot(position: [], facing: .none)
        let result = robot.report()
        
        #expect(result.0.isEmpty)
        #expect(result.1.isEmpty)
    }
    
    @Test
    func testReportReturnsValidOutputWhenPlaced() {
        let robot = Robot(position: [3, 4], facing: .south)
        let result = robot.report()
        
        #expect(result.0 == [3, 4])
        #expect(result.1 == "South")
    }
    
    // MARK: - Movement
    
    @Test
    func testMoveNorth() {
        let robot = Robot(position: [0, 0], facing: .north)
        robot.moveNorth()
        #expect(robot.position == [0, 1])
    }
    
    @Test
    func testMoveSouth() {
        let robot = Robot(position: [0, 1], facing: .south)
        robot.moveSouth()
        #expect(robot.position == [0, 0])
    }
    
    @Test
    func testMoveEast() {
        let robot = Robot(position: [0, 0], facing: .east)
        robot.moveEast()
        #expect(robot.position == [1, 0])
    }
    
    @Test
    func testMoveWest() {
        let robot = Robot(position: [1, 0], facing: .west)
        robot.moveWest()
        #expect(robot.position == [0, 0])
    }
    
    // MARK: - turnLeft()
    
    @Test
    func testTurnLeftFromNorth() {
        let robot = Robot(position: [0, 0], facing: .north)
        robot.turnLeft()
        #expect(robot.facing == .west)
    }
    
    @Test
    func testTurnLeftFromWest() {
        let robot = Robot(position: [0, 0], facing: .west)
        robot.turnLeft()
        #expect(robot.facing == .south)
    }
    
    @Test
    func testTurnLeftFromSouth() {
        let robot = Robot(position: [0, 0], facing: .south)
        robot.turnLeft()
        #expect(robot.facing == .east)
    }
    
    @Test
    func testTurnLeftFromEast() {
        let robot = Robot(position: [0, 0], facing: .east)
        robot.turnLeft()
        #expect(robot.facing == .north)
    }
    
    // MARK: - turnRight()
    
    @Test
    func testTurnRightFromNorth() {
        let robot = Robot(position: [0, 0], facing: .north)
        robot.turnRight()
        #expect(robot.facing == .east)
    }
    
    @Test
    func testTurnRightFromEast() {
        let robot = Robot(position: [0, 0], facing: .east)
        robot.turnRight()
        #expect(robot.facing == .south)
    }
    
    @Test
    func testTurnRightFromSouth() {
        let robot = Robot(position: [0, 0], facing: .south)
        robot.turnRight()
        #expect(robot.facing == .west)
    }
    
    @Test
    func testTurnRightFromWest() {
        let robot = Robot(position: [0, 0], facing: .west)
        robot.turnRight()
        #expect(robot.facing == .north)
    }
    
    @Test
    func testInitNorthVariants() {
        #expect(Facing("north") == .north)
        #expect(Facing("N") == .north)
        #expect(Facing("n") == .north)
    }
    
    @Test
    func testInitSouthVariants() {
        #expect(Facing("south") == .south)
        #expect(Facing("S") == .south)
        #expect(Facing("s") == .south)
    }
    
    @Test
    func testInitEastVariants() {
        #expect(Facing("east") == .east)
        #expect(Facing("E") == .east)
        #expect(Facing("e") == .east)
    }
    
    @Test
    func testInitWestVariants() {
        #expect(Facing("west") == .west)
        #expect(Facing("W") == .west)
        #expect(Facing("w") == .west)
    }
    
    @Test
    func testInitInvalidStringReturnsNone() {
        #expect(Facing("up") == .none)
        #expect(Facing("123") == .none)
        #expect(Facing("") == .none)
    }
    
    @Test
    func testRawValueCapitalizationUsedForReport() {
        let robot = Robot(position: [1, 1], facing: .east)
        let result = robot.report()
        
        #expect(result.1 == "East")   // capitalized
    }
}
