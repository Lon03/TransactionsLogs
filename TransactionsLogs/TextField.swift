//
//  TextField.swift
//  TransactionsLogs
//
//  Created by Mihail Martyniuk on 19.01.2021.
//


import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.makeUI()
    }
    
    func makeUI() {
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.placeholder = "Поиск"
        self.placeholderColor(color: #colorLiteral(red: 0.4431372549, green: 0.4705882353, blue: 0.5215686275, alpha: 1))
        self.backgroundColor = .white
        self.makeRoundedCorners(8)
        self.makeBorder(1, #colorLiteral(red: 0.6823529412, green: 0.7137254902, blue: 0.7529411765, alpha: 1))
        self.setLeftPaddingPoints(16)
        self.setRightPaddingPoints(16)
    }
}
