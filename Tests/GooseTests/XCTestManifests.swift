import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(GooseTests.allTests),
        testCase(FileTests.allTests),
    ]
}
#endif
