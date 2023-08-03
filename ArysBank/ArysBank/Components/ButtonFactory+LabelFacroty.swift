//
//  buttonFactory.swift
//  ArysBank
//
//  Created by Жека on 15/07/2023.
//

import UIKit

class FactoryComp: UIView  {
    
    func createButton(icon: String, target: Selector) -> UIButton {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: icon), for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: target, for: .touchUpInside)
        return button
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }
}
