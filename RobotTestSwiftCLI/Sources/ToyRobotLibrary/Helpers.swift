import Foundation

public class Helpers {
    static func processCommandString(_ commandString: String) -> [String] {
        let delimiters = CharacterSet(charactersIn: ",;").union(.whitespacesAndNewlines)
        return commandString
            .components(separatedBy: delimiters)
            .filter { !$0.isEmpty }
    }
}

public extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
