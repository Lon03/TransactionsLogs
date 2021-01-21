//
//  SearchTransactionPresenter.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import Foundation
import UIKit

class SearchTransactionPresenter: PresenterType {
    
    // MARK: Public properties
    
    weak var view: SearchTransactionViewInterface!
    
    // MARK: Public methods
    
    init(view: SearchTransactionViewInterface, provider: API) {
        self.view = view
        super.init(provider: provider)
    }
}

extension SearchTransactionPresenter: SearchTransactionPresentation {

    func getTransactionInfo(id: String) {
        self.view.activityIndicatorChange(true)
        self.provider.transactions(id: id, handler: {[weak self] result in
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
