//
// Created by color on 5/11/19.
//

import Foundation
import XCTest
@testable import Goose

final class FileTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let  f = File(path: "testfile.dat")
        XCTAssertFalse(f.exists,  "File exists")
        XCTAssertFalse(f.canRead,  "File canRead")

        let f1 = File(path: "./")
        XCTAssertTrue(f1.isDirectory,  "isDirectory")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}