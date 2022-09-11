import Foundation

public enum PuzzleDifficultyLevel: Int, CaseIterable {

    case easy, medium, hard, evil

    public static func level(count: Int) -> PuzzleDifficultyLevel {
        switch count {
            case 36:
                return .easy
            case 33:
                return .medium
            case 30:
                return .hard
            case 27:
                return .evil
            default:
                fatalError("Invalid puzzle.")
        }
    }

    public var numClues: Int {
        switch self {
            case .easy:
                return 36
            case .medium:
                return 33
            case .hard:
                return 30
            case .evil:
                return 27
        }
    }
}

extension PuzzleDifficultyLevel: CustomStringConvertible {
    public var description: String {
        switch self {
            case .easy:
                return "Easy"
            case .medium:
                return "Medium"
            case .hard:
                return "Hard"
            case .evil:
                return "Evil"
        }
    }
}
