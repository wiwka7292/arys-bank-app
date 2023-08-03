//
//  TransferMoneyView.swift
//  ArysBank
//
//  Created by Gor Zhenya on 01/08/2023.
//

import UIKit

class TransferMoneyView: UIView {
    
    var nameTextField: UITextField = {
        var field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .white
        field.widthAnchor.constraint(equalToConstant: 365).isActive = true
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.textAlignment = .center
        field.placeholder = "Name"
        return field
    }()
    
    var surnameTextField: UITextField = {
        var field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .white
        field.widthAnchor.constraint(equalToConstant: 365).isActive = true
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.textAlignment = .center
        field.placeholder = "Surname"

        return field
    }()
    
    var numberCardTextField: UITextField = {
        var field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .white
        field.widthAnchor.constraint(equalToConstant: 250).isActive = true
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.textAlignment = .center
        field.placeholder = "Number Card"
        return field
    }()
    
    var dataCardTextField: UITextField = {
        var field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .white
        field.widthAnchor.constraint(equalToConstant: 100).isActive = true
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.textAlignment = .center
        field.placeholder = "Data"
        return field
    }()
    
    var amountTextField: UITextField = {
        var field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .white
        field.widthAnchor.constraint(equalToConstant: 365).isActive = true
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.layer.borderColor = UIColor.systemGray3.cgColor
        field.layer.borderWidth = 1
        field.keyboardType = .numberPad
        field.textAlignment = .center
        field.placeholder = "Amount"
        return field
    }()
    
    var confirmButton: UIButton = {
        var button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(TransferMoneyVC.transferAmountTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var verticStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [nameTextField, surnameTextField, horizStackView, amountTextField])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    lazy var horizStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [numberCardTextField, dataCardTextField])
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        self.addSubview(verticStackView)
        self.addSubview(confirmButton)
    }
    
    func setupConstraints(){
        
        verticStackView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(200)
            make.left.right.equalTo(self).inset(20)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(100)
            make.left.right.equalTo(self).inset(50)
        }
    }
}
