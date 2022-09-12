import XCTest
@testable import SudokuPuzzles

final class SudokuPuzzlesTests: XCTestCase {

    func testExample() throws {
        XCTAssertNotNil(SudokuPuzzles.all)
        XCTAssertNotNil(SudokuPuzzles.test)
        
        for level in PuzzleDifficultyLevel.allCases {
            let puzzles = SudokuPuzzles.test[level]
            for _ in 0...puzzles.count {
                XCTAssertNotNil(puzzles.next)
            }
        }
    }
}
