//
//  ResultTransactionContract.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import Foundation
import UIKit

protocol ResultTransactionViewInterface: class {
    func showResult(data: CreditCheck?)
    func activityIndicatorChange(_ state: Bool)
}

protocol ResultTransactionPresentation: class {
    func getCreditCheck(id: Int)
}
