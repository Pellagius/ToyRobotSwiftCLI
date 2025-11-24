import Testing
@testable import ToyRobotLibrary

struct StringsTests {

    @Test
    func testCommandPrompt() {
        #expect(Strings.commandPrompt == "Enter commands: ")
    }

    @Test
    func testStartPrompt() {
        let expected = """
        
        Toy Robot Standing by!

        First, put me down on the table with a PLACE command followed X,Y,F, see this example:

        Place 2,3,North

        with X and Y being 0 or greater and 5 or less - and F being NORTH, SOUTH, EAST or WEST to point me in a direction.
        After placement, you may command me with MOVE (to move forward 1 space) or LEFT or RIGHT (to turn left or right) or REPORT to show my position and current facing.

        """
        #expect(Strings.startPrompt == expected)
    }

    @Test
    func testPlacementFailed() {
        let expected = """
        
        You need to PLACE me on the table with PLACE X,Y,F coordinate first - Remember the command: PLACE followed by X,Y, followed lastly by F the direction to face, see this exmaple
            Place 0,0, North OR PLACE 2,3 N

        Try placement again.

        """
        #expect(Strings.placmentFailed == expected)
    }

    @Test
    func testPlacementComplete() {
        #expect(Strings.placementComplete == "\nPlacement complete - ready to move out.\n")
    }

    @Test
    func testInvalidPosition() {
        let expected = """
        
        Whoops! Thats not a valid position. Here is an example of how the placement should be entered:
        X,Y,F: 2,3,North or 4,5 E or 0,0,WEST - remember, X and Y must be between 0 and 5 inclusively - try placement again

        """
        #expect(Strings.invalidPosition == expected)
    }

    @Test
    func testInvalidFacing() {
        let expected = """
        I can only move in 4 directions - North(N), South(S), East(E), West(W),
        the 'F' coordinate needs to be one of these - try placement again

        """
        #expect(Strings.invalidFacing == expected)
    }

    @Test
    func testNotYetPlaced() {
        #expect(Strings.notYetPlaced == "\nI can't provide a report - I haven't been placed yet.\n")
    }

    @Test
    func testMovementComplete() {
        #expect(Strings.movementComplete == "Movements complete\n")
    }

    @Test
    func testPlacementAndMovementComplete() {
        #expect(Strings.plcementAndMovementComplete == "Placement done and movements complete\n")
    }

    @Test
    func testReportFormat() {
        let formatted = String(format: Strings.report, 2, 3, "North")
        #expect(formatted == "\nMy position is 2, 3 and im facing North\n")
    }
}
