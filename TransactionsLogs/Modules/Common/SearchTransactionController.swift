//
//  SearchTransactionController.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import UIKit

extension SearchTransactionController: SearchTransactionViewInterface {
    func showResult(data: Transaction?) {
        guard let provider = self.presenter?.provider else {
            return
        }
        self.navigator.show(segue: .resultTransaction(provider: provider, transactionInfo: data), sender: self)
    }

    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

class SearchTransactionController: UIViewControllerCustom, Navigatable {
    
    @IBOutlet weak var textField: TextField!
    @IBOutlet weak var searchButton: ButtonTitle! {
        willSet {
            newValue.setTitle("Search", for: .normal)
        }
    }
    
    
    private var presenter: SearchTransactionPresenter?
    var navigator: Navigator!
    
    convenience init(navigator: Navigator) {
        self.init()
        self.navigator = navigator
    }
    
    // MARK: Public methods

    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? SearchTransactionPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    
    private func makeUI() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func searchButton(_ sender: ButtonTitle) {
        guard let value = self.textField.text else {
            return
        }
        self.presenter?.getTransactionInfo(id: value)
    }
    
}
