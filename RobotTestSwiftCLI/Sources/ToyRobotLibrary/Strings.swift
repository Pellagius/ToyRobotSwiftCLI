import Foundation

public struct Strings {
    static let commandPrompt = "Enter commands: "
    static let startPrompt = "\nToy Robot Standing by!\n\nFirst, put me down on the table with a PLACE command followed X,Y,F, see this example:\n\nPlace 2,3,North\n\nwith X and Y being 0 or greater and 5 or less - and F being NORTH, SOUTH, EAST or WEST to point me in a direction.\nAfter placement, you may command me with MOVE (to move forward 1 space) or LEFT or RIGHT (to turn left or right) or REPORT to show my position and current facing.\n"
    
    static let placmentFailed = "\nYou need to PLACE me on the table with PLACE X,Y,F coordinate first - Remember the command: PLACE followed by X,Y, followed lastly by F the direction to face, see this exmaple\n    Place 0,0, North OR PLACE 2,3 N\n\nTry placement again.\n"
    static let placementComplete =  "\nPlacement complete - ready to move out.\n"
    static let invalidPosition = "\nWhoops! Thats not a valid position. Here is an example of how the placement should be entered:\nX,Y,F: 2,3,North or 4,5 E or 0,0,WEST - remember, X and Y must be between 0 and 5 inclusively - try placement again\n"
    static let invalidFacing = "I can only move in 4 directions - North(N), South(S), East(E), West(W),\nthe 'F' coordinate needs to be one of these - try placement again\n"
    static let notYetPlaced = "\nI can't provide a report - I haven't been placed yet.\n"
    static let movementComplete = "Movements complete\n"
    static let plcementAndMovementComplete = "Placement done and movements complete\n"
    static let report = "\nMy position is %d, %d and im facing %@\n"
}
