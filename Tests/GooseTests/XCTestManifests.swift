import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GooseTests.allTests),
        testCase(PathTests.allTests),
        testCase(FileTests.allTests),
    ]
}
#endif
