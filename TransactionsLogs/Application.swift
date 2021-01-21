//
//  Application.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import UIKit

final class Application: NSObject {
    static let shared = Application()
    
    var window: UIWindow?
    
    var provider: API
    let navigator: Navigator
    
    private override init() {
        self.navigator = Navigator.default
        self.provider = RestApi()
        super.init()
    }
    
    func presentInitialScreen(in window: UIWindow?) {
        guard let window = window else { return }
        self.window = window

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigator.show(segue: .searchTransaction(provider: self.provider), sender: nil, transition: .root(in: window))
        }
    }
}
