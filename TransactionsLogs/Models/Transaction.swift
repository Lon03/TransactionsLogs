//
//  Transaction.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import Foundation
import SwiftyJSON

enum TransactionResult: String {
    case yes = "Yes"
    case no = "No"
    case notFound = "Not Found"
}


struct Transaction {
    var id: Int?
    var name: String?
    var result: TransactionResult?

    init(json: JSON) {
        id = json["id"].int
        name = json["name"].string
        result = TransactionResult(rawValue: json["result"].stringValue)

    }
    init?() {}
}
