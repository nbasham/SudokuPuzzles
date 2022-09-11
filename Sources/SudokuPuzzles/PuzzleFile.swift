import Foundation

public class PuzzlesFile {
    let fileName: String
    private lazy var puzzles: [[Int]] = loadPuzzles()

    init(fileName: String) {
        self.fileName = fileName
    }
    
    public var next: [Int] {
        var index = UserDefaults.standard.integer(forKey: fileName)
        if index >= count {
            index = 0
        }
        UserDefaults.standard.set(index + 1, forKey: fileName)
        return puzzles[index]
    }
    
    public var count: Int { puzzles.count }
    
    private func loadPuzzles() -> [[Int]] {
        convert(loadPuzzleStrings())
    }
    
    private func loadPuzzleStrings() -> [String] {
        Bundle.module.decode([String].self, from: "\(fileName)")
    }
    
    private func convert(_ puzzleStrings: [String]) -> [[Int]] {
        puzzleStrings.map { stringToPuzzle($0) }
    }
    
    private func stringToPuzzle(_ string: String) -> [Int] {
        string.split(separator: ",").map { String($0) }.map { Int($0)! }
    }
}

//  Paul Hudson
// swiftlint:disable line_length
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = Bundle.module.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
