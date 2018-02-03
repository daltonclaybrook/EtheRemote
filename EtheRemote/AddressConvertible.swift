//
//  AddressConvertible.swift
//  EtheRemote
//
//  Created by Dalton Claybrook on 2/1/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import Foundation

protocol AddressConvertible: Encodable {
    func makeAddressString() -> String
}

extension AddressConvertible {
    func encode(to encoder: Encoder) throws {
        try makeAddressString().encode(to: encoder)
    }
}

extension AddressConvertible {
    var isValidAddress: Bool {
        let address = makeAddressString()
        // 20 bytes (2 char per byte) + 2 char prefix
        guard address.count == 42 else { return false }
        let endOfPrefix = address.index(address.startIndex, offsetBy: 2)
        guard address[..<endOfPrefix] == "0x" else { return false }
        
        let characterSet = CharacterSet(charactersIn: "0123456789abcdefABCDEF").inverted
        let invalidRange = address[endOfPrefix...].rangeOfCharacter(from: characterSet)
        return invalidRange == nil
    }
}

extension String: AddressConvertible {
    func makeAddressString() -> String {
        return self
    }
}

extension Data: AddressConvertible {
    func makeAddressString() -> String {
        return reduce("0x") { $0 + String(format: "%02x", $1) }
    }
}
