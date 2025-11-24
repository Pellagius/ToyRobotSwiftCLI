import Foundation

public struct MovementHandler {
    
    func handleMovement(_ commandsList: [String], _ robot: Robot) -> String {
        var report: String?
        for command in commandsList {
            if isCommandMove(command) {
                handleMove(robot)
            }
            else if isCommandLeft(command) {
                robot.turnLeft()
            }
            else if isCommandRight(command) {
                robot.turnRight()
            }
            else if isCommandReport(command) {
                report = handleReporting(robot)
            }
        }
        return report ?? ""
    }

    private func isCommandMove(_ command: String) -> Bool {
        return ["move", "m"].contains(command.lowercased())
    }

    private func isCommandLeft(_ command: String) -> Bool {
        return ["left", "l"].contains(command.lowercased())
    }

    private func isCommandRight(_ command: String) -> Bool {
        return ["right", "r"].contains(command.lowercased())
    }

    private func isCommandReport(_ command: String) -> Bool {
        ["report", "r"].contains(command.lowercased())
    }

    private func handleMove(_ robot: Robot) {
        if robot.facing == .north, robot.position[1] <= 4  {
            robot.moveNorth()
        }
        else if robot.facing == .south, robot.position[1] >= 1 {
            robot.moveSouth()
        }
        else if robot.facing == .east, robot.position[0] <= 4 {
            robot.moveEast()
        }
        else if robot.facing == .west, robot.position[0] >= 1 {
            robot.moveWest()
        }
    }

    private func handleReporting(_ robot: Robot) -> String {
        let report = robot.report()
        if report.0.isEmpty || report.1.isEmpty {
            return Strings.notYetPlaced
        } else {
            return  String(format: Strings.report, report.0[0], report.0[1], report.1)
        }
    }
}
