import SwiftUI

public struct SudokuPuzzles {
/*    public static let all = Puzzles(files: [("puzzles_easy.json", .easy),
                                      ("puzzles_medium.json", .medium),
                                      ("puzzles_hard.json", .hard),
                                      ("puzzles_evil.json", .evil)])
    public static let test = Puzzles(files: [("test_puzzles_easy.json", .easy),
                                             ("test_puzzles_medium.json", .medium),
                                             ("test_puzzles_hard.json", .hard),
                                             ("test_puzzles_evil.json", .evil)])
*/
    static let all = Puzzles(files: PuzzleDifficultyLevel.allCases.map { ("puzzles/puzzles_\($0.description.lowercased()).json", $0) })

    static let test = Puzzles(files: PuzzleDifficultyLevel.allCases.map { ("puzzles/test_puzzles_\($0.description.lowercased()).json", $0) })
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
