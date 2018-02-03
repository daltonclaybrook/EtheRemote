//
//  Block.swift
//  EtheRemote
//
//  Created by Dalton Claybrook on 2/3/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import Foundation

enum BlockParam {
    case latest
    case earliest
    case pending
    case exact(hex: String)
}

extension BlockParam: CustomStringConvertible {
    var description: String {
        switch self {
        case .latest:
            return "latest"
        case .earliest:
            return "earliest"
        case .pending:
            return "pending"
        case .exact(let hex):
            return hex
        }
    }
}
