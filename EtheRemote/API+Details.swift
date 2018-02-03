//
//  API+Details.swift
//  EtheRemote
//
//  Created by Dalton Claybrook on 2/1/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import Foundation

extension API {
    var method: String {
        switch self {
        case .call:
            return "eth_call"
        default:
            fatalError("not implemented")
        }
    }
    
    
}
