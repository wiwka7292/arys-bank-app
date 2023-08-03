//
//  CollectionCell.swift
//  ArysBank
//
//  Created by Жека on 15/07/2023.
//

import UIKit
import SnapKit

class СreditСardCell: UICollectionViewCell {
    
    static var reuseId = "CollectionViewCell"
    
    var card: Card?
    
    var amount = 1337
    
    var amountLabel: UILabel = {
        var label = UILabel()
        label.text = "14529$"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    var balanceLabel: UILabel = {
        var label = UILabel()
        label.text = "Balance:"
        label.textColor = .white
        return label
    }()
    
    var numberCard: UILabel = {
        var label = UILabel()
        label.text = "****  ****  ****  7532"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var validThruData: UILabel = {
        var label = UILabel()
        label.text = "02/28"
        label.textColor = .white
        return label
    }()
    
    var cardInitials: UILabel = {
        var label = UILabel()
        label.text = "SERGEY GORNOSTAYEV"
        label.textColor = .white
        return label
    }()
    
    var visaLabel: UILabel = {
        var label = UILabel()
        label.text = "VISA"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    lazy var stackBalanceView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [balanceLabel, amountLabel])
        stack.axis = .vertical
        return stack
    }()
    
    lazy var stackNameAndDataView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [cardInitials, validThruData])
        stack.spacing = 20
        return stack
    }()
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackBalanceView, numberCard, stackNameAndDataView])
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        loadAmountFromUserDefaults()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(stackView)
        contentView.addSubview(visaLabel)
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        visaLabel.snp.makeConstraints { make in
            make.right.top.equalTo(contentView).inset(20)
        }
        
    }
    
    
    func updateValue(_ value: Int){
        self.amount += value
        amountLabel.text = "\(amount)$"
        saveAmountToUserDefaults()
    }
    
    func updateValueTransfer(_ value: Int){
        self.amount -= value
        amountLabel.text = "\(amount)$"
        saveAmountToUserDefaults()
    }
    
    func update(_ card: Card){
        self.card = card
        cardInitials.text = card.nameSurname
        numberCard.text = "****  ****  ****  " + card.numberCart
        validThruData.text = card.period
    }
    
    func saveAmountToUserDefaults() {
        UserDefaults.standard.set(amount, forKey: "SavedAmount")
    }
    
    func loadAmountFromUserDefaults() {
        if let savedAmount = UserDefaults.standard.value(forKey: "SavedAmount") as? Int {
            self.amount = savedAmount
            amountLabel.text = "\(amount)$"
        }
    }
    
}
