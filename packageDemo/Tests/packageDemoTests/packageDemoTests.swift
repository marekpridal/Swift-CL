import XCTest
@testable import packageDemo

class packageDemoTests: XCTestCase
{
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(packageDemo, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
