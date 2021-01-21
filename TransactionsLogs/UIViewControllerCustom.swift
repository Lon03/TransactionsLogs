//
//  UIViewControllerCustom.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import UIKit

class UIViewControllerCustom: UIViewController {
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setConstraint() {
        for subview in [activityIndicatorView] {
            subview.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(subview)
        }

        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -35),
            self.activityIndicatorView.widthAnchor.constraint(equalToConstant: 40),
            self.activityIndicatorView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
}
