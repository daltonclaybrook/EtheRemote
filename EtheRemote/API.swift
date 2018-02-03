//
//  API.swift
//  EtheRemote
//
//  Created by Dalton Claybrook on 2/1/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import Foundation

enum API {
    case getWeb3ClientVersion
    case getNetVersion
    case getPeerCount
    case getEthereumProtocolVersion
    case getSyncStatus
    case getGasPrice
    case getNodeAccounts
    case getHighestBlock
    case getBalance
    case getTransactionCount
    case call
}
