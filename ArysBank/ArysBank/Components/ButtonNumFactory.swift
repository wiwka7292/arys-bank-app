//
//  ButtonNumFactory.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import UIKit

class ButtonNumFactory{
    
    func buttonNumFactory(num: String) -> UIButton {
        let button = UIButton()
        button.setTitle(num, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 25
        return button
    }
}
