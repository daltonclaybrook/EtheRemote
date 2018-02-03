//
//  NodeClient.swift
//  EtheRemote
//
//  Created by Dalton Claybrook on 2/1/18.
//  Copyright © 2018 Dalton Claybrook. All rights reserved.
//

import Foundation

public struct NodeClient {
    public let nodeURL: URL
    
    private let session: URLSession
    
    public init(nodeURL: URL, session: URLSession? = nil) {
        self.nodeURL = nodeURL
        self.session = session ?? URLSession(configuration: .default)
    }
    
    
}
