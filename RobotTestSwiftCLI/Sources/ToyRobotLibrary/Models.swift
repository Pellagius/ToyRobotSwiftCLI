import Foundation

public class Robot {
    private(set) var position: [Int] = []
    private(set) var facing = Facing.none
    
    init(position: [Int], facing: Facing) {
        self.position = position
        self.facing = facing
    }
    
    func isPlaced() -> Bool {
        return !position.isEmpty && facing != .none
    }

    func report() -> ([Int], String) {
        if !isPlaced() {
            return ([], "")
        } else {
            return ([position[0], position[1]], facing.rawValue.capitalized)
        }
    }

    func moveNorth() {
        position[ 1] += 1
    }

    func moveSouth() {
        position[1] -= 1
    }

    func moveEast() {
        position[0] += 1
    }

    func moveWest() {
        position[0] -= 1
    }

    func turnLeft() {
        if facing == .north {
            self.facing = .west
        }
        else if facing == .west {
            self.facing = .south
        }
        else if facing == .south {
            self.facing = .east
        }
        else if facing == .east {
            self.facing = .north
        }
    }

    func turnRight() {
        if facing == .north {
            self.facing = .east
        }
        else if facing == .west {
            self.facing = .north
        }
        else if facing == .south {
            self.facing = .west
        }
        else if facing == .east {
            self.facing = .south
        }
    }
}


public enum Facing: String {
    case north
    case east
    case west
    case south
    case none
    
    init(_ rawValue: String) {
        if ["north", "n"].contains(rawValue.lowercased()) { self = .north }
        else if ["south", "s"].contains(rawValue.lowercased()) { self = .south }
        else if ["east", "e"].contains(rawValue.lowercased()) { self = .east }
        else if ["west", "w"].contains(rawValue.lowercased()) { self = .west }
        else {
            self = .none
        }
    }
}
