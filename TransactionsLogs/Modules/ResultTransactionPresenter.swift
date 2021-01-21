//
//  ResultTransactionPresenter.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import Foundation
import UIKit

class ResultTransactionPresenter: PresenterType {
    
    // MARK: Public properties
    
    weak var view: ResultTransactionViewInterface!
    
    // MARK: Public methods
    
    init(view: ResultTransactionViewInterface, provider: API) {
        self.view = view
        super.init(provider: provider)
    }
}

extension ResultTransactionPresenter: ResultTransactionPresentation {
    func getCreditCheck(id: Int) {
        self.view.activityIndicatorChange(true)
        self.provider.creditCheck(id: id, handler: {[weak self] result in
            guard let self = self else { return }
            self.view.activityIndicatorChange(false)
            switch result {
            case let .success(data):
                self.view.showResult(data: data)
            case let .failure(err):
                print("Error: \(err)")
            }
        })
    }
}
