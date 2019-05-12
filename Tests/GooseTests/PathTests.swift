//
// Created by color on 5/11/19.
//

import Foundation
import XCTest
@testable import Goose

final class PathTests: XCTestCase {
    func testExample() {
        var path = Path("")
        path.fileName = "hello.doc"

        XCTAssertEqual(path.extension, ".doc", "test extension")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}