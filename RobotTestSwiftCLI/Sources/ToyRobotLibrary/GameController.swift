import Foundation


public class GameController {
    
    private var robot: Robot?
    let placementHandler = PlacementHandler()
    let movementHandler = MovementHandler()
    
    public init(robot: Robot? = nil) {
        self.robot = robot
    }

    public func start() {
        print(Strings.startPrompt)
        while true {
            print(Strings.commandPrompt)
            if let commandsString = readLine() {
                let commandsList = Helpers.processCommandString(commandsString)
                
                // If placed, then move
                if let robot = robot, robot.isPlaced() {
                    let report = movementHandler.handleMovement(commandsList, robot)
                    if !report.isEmpty {
                        print(report)
                    }
                    print(Strings.movementComplete)
                    continue
                }
                // If not place
                let placementCommands = placementHandler.handlePlacement(commandsList)
                if  !placementCommands.isEmpty {
                    if let x = Int(placementCommands[1]), let y = Int(placementCommands[2]) {
                        robot = Robot(
                            position: [x, y],
                            facing: Facing(placementCommands[3])
                        )
                    }
                    // Then move
                    if !Array(placementCommands[4..<placementCommands.count]).isEmpty {
                        if let robot = robot {
                            let array: [String] = Array(placementCommands[4..<placementCommands.count])
                            let report = movementHandler.handleMovement(array, robot)
                            if !report.isEmpty {
                                print(report)
                            }
                            print(Strings.plcementAndMovementComplete)
                        }
                    } else {
                        print(Strings.placementComplete)
                    }
                   
                }
            }
            continue
        }
    }
}
