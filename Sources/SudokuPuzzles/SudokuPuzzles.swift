import SwiftUI

public struct SudokuPuzzles {
    public static let all = Puzzles(files: PuzzleDifficultyLevel.allCases.map { ("puzzles/puzzles_\($0.rawValue).json", $0) })

    public static let test = Puzzles(files: PuzzleDifficultyLevel.allCases.map { ("puzzles/test_puzzles_\($0.rawValue).json", $0) })
}

public class Puzzles {
    private let puzzles: [PuzzleDifficultyLevel: PuzzlesFile]
    public subscript(level: PuzzleDifficultyLevel) -> PuzzlesFile {
        puzzles[level]!
    }

    init(files: [(String, PuzzleDifficultyLevel)]) {
        puzzles = files.reduce(into: [PuzzleDifficultyLevel: PuzzlesFile]()) { dict, tuple in
            dict[tuple.1] = PuzzlesFile(fileName: tuple.0)
        }
    }
}
