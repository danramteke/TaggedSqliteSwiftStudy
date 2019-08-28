import XCTest

import taggedtestTests

var tests = [XCTestCaseEntry]()
tests += taggedtestTests.allTests()
XCTMain(tests)
