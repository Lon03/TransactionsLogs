//
//  ButtonTitle.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//

import UIKit

public class ButtonTitle: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.makeUI()
    }

    func makeUI() {

        self.makeRoundedCorners(10)
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9254901961, blue: 0.2078431373, alpha: 1)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.setTitle(nil, for: .normal)
        self.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        self.updateUI()
    }

    func updateUI() {
        setNeedsDisplay()
    }
}
