import Foundation

public struct PlacementHandler {
    
    func handlePlacement(_ commandsList: [String]) -> [String] {
        let placementCommands = findLastPlacement(commandsList)
        if placementCommands.isEmpty {
            print(Strings.placmentFailed)
            return []
        }
        guard let positionX = placementCommands[safe: 1], let positionY = placementCommands[safe: 2] else { return [] }
        if isInvalidPosition([positionX, positionY]) {
            print(Strings.invalidPosition)
            return []
        }
        if isInvalidFacing(placementCommands[safe: 3]) {
            print(Strings.invalidFacing)
            return []
        }
        return placementCommands
    }

    private func isInvalidPosition(_ position: [String]) -> Bool {
        if let x = Int(position[0]), let y = Int(position[1]) {
            return (x < 0 || x > 5) || (y < 0 || y > 5)
        }
        return false
    }

    private func isInvalidFacing(_ direction: String?) -> Bool {
        guard let direction = direction else { return false }
        return !["north", "south", "east", "west", "n", "s", "w", "e"].contains(direction.lowercased())
    }

    private func findLastPlacement(_ commandsList: [String]) -> [String] {
        var currentIndex: Int?

        for (index, item) in commandsList.enumerated().reversed() {
            if ["place", "p"].contains(item.lowercased()) {
                currentIndex = index
                break
            }
        }
        
        guard let index = currentIndex else { return []}
        return Array(commandsList[index...])
    }
}
