//
//  SearchTransactionContract.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import Foundation
import UIKit

protocol SearchTransactionViewInterface: class {
    func showResult(data: Transaction?)
    func activityIndicatorChange(_ state: Bool)
}

protocol SearchTransactionPresentation: class {
    func getTransactionInfo(id: String)
}

