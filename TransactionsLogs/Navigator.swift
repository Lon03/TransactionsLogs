//
//  Navigator.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import Foundation
import UIKit
import SafariServices
import UIKit

protocol Navigatable {
    var navigator: Navigator! { get set }
}

class Navigator {
    static var `default` = Navigator()
    
    // MARK: - segues list, all app scenes
    enum Scene {
        case searchTransaction(provider: API)
        case resultTransaction(provider: API, transactionInfo: Transaction?)
    }
    
    enum Transition {
        case root(in: UIWindow)
        case navigation
        case modal
        case alert
    }
    
    // MARK: - get a single VC
    func get(segue: Scene) -> UIViewController? {
        switch segue {
        case let .searchTransaction(provider):
            let cv = SearchTransactionController(navigator: self)
            let presenter = SearchTransactionPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
        case let .resultTransaction(provider, transactionInfo):
            let cv = ResultTransactionController(navigator: self, transactionInfo: transactionInfo)
            let presenter = ResultTransactionPresenter(view: cv, provider: provider)
            cv.setPresenter(presenter)
            return cv
        }
    }
    
    func pop(sender: UIViewController?, toRoot: Bool = false) {
        if toRoot {
            sender?.navigationController?.popToRootViewController(animated: true)
        } else {
            sender?.navigationController?.popViewController(animated: true)
        }
    }
    
    func dismissNavigation(sender: UIViewController?) {
        sender?.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func dismiss(sender: UIViewController?) {
        sender?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - invoke a single segue
    func show(segue: Scene, sender: UIViewController?, transition: Transition = .navigation) {
        if let target = get(segue: segue) {
            self.show(target: target, sender: sender, transition: transition)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case .root(in: let window):
            
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = UINavigationController(rootViewController: target)
                window.makeKeyAndVisible()
            }, completion: nil)
            return
        default: break
        }
        
        guard let sender = sender else {
            fatalError("You need to pass in a sender for .navigation or .modal transitions")
        }
        
        if let nav = sender as? UINavigationController {
            //push root controller on navigation stack
            target.hidesBottomBarWhenPushed = true
            nav.pushViewController(target, animated: false)
            return
        }
        switch transition {
        case .navigation:
            if let nav = sender.navigationController {
                target.hidesBottomBarWhenPushed = true
                nav.pushViewController(target, animated: true)
                
            }
        case .modal:
            DispatchQueue.main.async {
                let cv = target
                cv.modalPresentationStyle = .fullScreen
                sender.present(cv, animated: true, completion: nil)
            }
        case .alert:
            DispatchQueue.main.async {
                sender.present(target, animated: true, completion: nil)
            }
        default: break
        }
    }
}
