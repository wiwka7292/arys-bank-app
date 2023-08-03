//
//  AddMoneyView.swift
//  ArysBank
//
//  Created by Жека on 21/07/2023.
//

import UIKit

class AddMoneyView: UIView {
    
    var textField: UITextField = {
        var field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .white
        field.widthAnchor.constraint(equalToConstant: 250).isActive = true
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.textAlignment = .center
        return field
    }()
    
    var addButton: UIButton = {
        var button = UIButton()
        button.setTitle("Add money", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(AddMoneyVC.addCurrentAmountTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupViews(){
        self.addSubview(textField)
        self.addSubview(addButton)
    }
    
    func setupConstraints(){
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(100)
            make.left.right.equalTo(self).inset(50)
        }
    }
}
