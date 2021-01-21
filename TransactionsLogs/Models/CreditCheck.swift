//
//  CreditCheck.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import Foundation
import SwiftyJSON

struct CreditCheck {
    var name: String?

    init(json: JSON) {
        name = json["name"].string
    }
    
    init?() {}
}
