//
//  PresenterType.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import Foundation

class PresenterType: NSObject {
    
    let provider: API
    
    var page = 1

    init(provider: API) {
        self.provider = provider
        super.init()

    }
    
    deinit {
    }
}
