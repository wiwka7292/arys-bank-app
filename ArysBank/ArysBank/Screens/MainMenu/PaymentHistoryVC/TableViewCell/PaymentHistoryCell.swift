//
//  PaymentHistoryCell.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class PaymentHistoryCell: UITableViewCell{
    
    static var reuseId = "PaymentHistoryCell"
    
    var history: History?

    var nameOfPayment: UILabel = {
        var label = UILabel()
        label.text = "Add Money"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var amountOfPayment: UILabel = {
        var label = UILabel()
        label.text = "123$"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [nameOfPayment, amountOfPayment])
        stack.axis = .horizontal
        stack.contentMode = .scaleToFill
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15)
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(stackView)
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update( _ history: History) {
        self.history = history
        if history.name == "Add money"{
            nameOfPayment.text = history.name
            nameOfPayment.textColor = .systemGreen
            amountOfPayment.text = "+\(history.amount)$"
            amountOfPayment.textColor = .systemGreen
        }else {
            nameOfPayment.text = history.name
            nameOfPayment.textColor = .red
            amountOfPayment.text = "-\(history.amount)$"
            amountOfPayment.textColor = .red
        }
        
       
    }
}
