//
//  Api.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import Foundation

protocol API {
    func transactions(id: String, handler: @escaping ((Result<Transaction?>)->Void))
    func creditCheck(id: Int, handler: @escaping ((Result<CreditCheck?>)->Void))
}
