//
//  Transaction.swift
//  EtheRemote
//
//  Created by Dalton Claybrook on 2/3/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import Foundation

typealias Wei = UInt64

struct Transaction: Codable {
    /// The address the transaction is sent from.
    let from: AddressConvertible?
    /// The address the transaction is directed to.
    let to: AddressConvertible
    /// Integer of the gas provided for the transaction execution. eth_call consumes zero gas, but this parameter may be needed by some executions.
    let gas: Wei?
    /// Integer of the gasPrice used for each paid gas
    let gasPrice: Wei?
    /// Integer of the value send with this transaction
    let value: Int?
    /// Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI
    let data: Data?
    /// Integer of a nonce. This allows to overwrite your own pending transactions that use the same nonce.
    let nonce: Int?
    
    init(
        from: AddressConvertible? = nil,
        to: AddressConvertible,
        gas: Wei? = nil,
        gasPrice: Wei? = nil,
        value: Int? = nil,
        data: Data? = nil,
        nonce: Int? = nil
    ) {
        self.from = from
        self.to = to
        self.gas = gas
        self.gasPrice = gasPrice
        self.value = value
        self.data = data
        self.nonce = nonce
    }
}
