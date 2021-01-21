//
//  ResultTransactionController.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 21.01.2021.
//

import UIKit

extension ResultTransactionController: ResultTransactionViewInterface {
    func showResult(data: CreditCheck?) {
    }
    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}

class ResultTransactionController: UIViewControllerCustom, Navigatable {
    
    @IBOutlet weak var nameLabel: UILabel! {
        willSet {
            newValue.text = nil
            newValue.textAlignment = .center
            newValue.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            newValue.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel! {
        willSet {
            newValue.text = nil
            newValue.textAlignment = .center
            newValue.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            newValue.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    @IBOutlet weak var creditCheckButton: ButtonTitle! {
        willSet {
            newValue.isHidden = true
            newValue.setTitle("Get credit check", for: .normal)
        }
    }
    
    private var presenter: ResultTransactionPresenter?
    var navigator: Navigator!
    var transactionInfo: Transaction?
    
    convenience init(navigator: Navigator, transactionInfo: Transaction?) {
        self.init()
        self.navigator = navigator
        self.transactionInfo = transactionInfo
    }
    
    // MARK: Public methods

    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? ResultTransactionPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    
    private func makeUI() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.nameLabel.text = self.transactionInfo?.name
        self.resultLabel.text = self.transactionInfo?.result?.rawValue
        self.creditCheckButton.isHidden = self.transactionInfo?.result != TransactionResult.notFound
    }
    
    @IBAction func creditCheckButton(_ sender: ButtonTitle) {
        guard let id = self.transactionInfo?.id else {
            return
        }
        self.presenter?.getCreditCheck(id: id)
    }
}
