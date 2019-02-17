import XCTest
@testable import jukebolix

final class jukebolixTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(jukebolix().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
