//
//  NameDescribable.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import UIKit

protocol NameDescribable {
    var reuseIdentifier: String { get }
    static var reuseIdentifier: String { get }
}

extension NameDescribable {
    var reuseIdentifier: String {
        return String(describing: type(of: self))
    }

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
