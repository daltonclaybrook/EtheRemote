//
//  AddressConvertibleTests.swift
//  EtheRemoteTests
//
//  Created by Dalton Claybrook on 2/1/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import XCTest
@testable import EtheRemote

class AddressConvertibleTests: XCTestCase {
    func testMissingPrefixIsInvalid() {
        let address = randomString(withLenth: 20, prefix: false)
        XCTAssertFalse(address.isValidAddress)
    }
    
    func testWrongLengthIsInvalid() {
        let tooLong = randomString(withLenth: 25)
        let tooShort = randomString(withLenth: 17)
        XCTAssertFalse(tooLong.isValidAddress)
        XCTAssertFalse(tooShort.isValidAddress)
    }
    
    func testInvalidCharacterIsInvalid() {
        let address = "0x5204f18c652d1c31c6a5968cb65e0119152zwhum"
        XCTAssertFalse(address.isValidAddress)
    }
    
    func testValidStringIsValid() {
        let address = randomString(withLenth: 20)
        XCTAssertTrue(address.isValidAddress)
    }
    
    func testValidStringWithCapitalsIsValid() {
        let address = "0x5204f18c652d1c31c6a5968cb65e0119152ABCDE"
        XCTAssertTrue(address.isValidAddress)
    }
    
    func testWrongDataLenthIsInvalid() {
        let tooShort = randomData(withLenth: 19)
        let tooLong = randomData(withLenth: 21)
        XCTAssertFalse(tooShort.isValidAddress)
        XCTAssertFalse(tooLong.isValidAddress)
    }
    
    func testValidDataIsValid() {
        let address = randomData(withLenth: 20)
        XCTAssertTrue(address.isValidAddress)
    }
    
    // MARK: Private
    
    private func randomString(withLenth length: Int, prefix: Bool = true) -> String {
        let address = randomData(withLenth: length).makeAddressString()
        let prefixIndex = address.index(address.startIndex, offsetBy: 2)
        return prefix ? address : String(address[prefixIndex...])
    }
    
    private func randomData(withLenth length: Int) -> Data {
        let bytes = (0..<length).reduce([UInt8]()) { result, _ in
            let byte = UInt8(arc4random_uniform(UInt32(UInt8.max) + 1))
            return result + [byte]
        }
        return Data(bytes: bytes)
    }
}
