//
//  ErrorTests.swift
//  ErrorTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Error

class ErrorTests: XCTestCase
{
    func test_error()
    {
        let underlyingError = NSError()
        
        let error = NSError(domain: "doamin", code: 12, description: "localized test description", reason: nil, underlyingError: underlyingError)
        
        XCTAssertEqual(error.domain, "doamin")
        XCTAssertEqual(error.localizedDescription, "localized test description")
        XCTAssertNil(error.localizedFailureReason)
        XCTAssertEqual(error.underlyingError, underlyingError)
        XCTAssertEqual(error.code, 12)
    }
}
