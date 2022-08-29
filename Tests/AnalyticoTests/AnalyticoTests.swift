import XCTest
@testable import Analytico

final class AnalyticoTests: XCTestCase {
    func testBasicTrace() throws {
        // init Analytico and add random event
        let testEntry = SessionEntry(type: .systemEvent(.appStart), metaData: "Testing app start trace")
        Analytico.trace(entry: testEntry)
        
        // make sure it matches expectations
        print(Analytico.collect())
        XCTFail()
    }
}
