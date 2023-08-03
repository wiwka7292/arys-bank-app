//
//  ExchangeRatesView.swift
//  ArysBank
//
//  Created by Жека on 15/07/2023.
//

import UIKit

class ExchangeRatesViewCell: UITableViewCell {
    
    static var reuseId = "ExchangeRatesViewCell"
    
    var currency: Currency?
    
    var countryViewlabel: UILabel = {
        var label = UILabel()
        label.text = "USD"
        label.textColor = .black
        return label
    }()
    var countryImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "USA")
        image.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.1 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.1 * width).isActive = true
        return image
    }()
    var buyCurrencylabel: UILabel = {
        var label = UILabel()
        label.text = "4.12"
        label.textColor = .black
        return label
    }()
    
    var sellCurrencylabel: UILabel = {
        var label = UILabel()
        label.text = "4.25"
        label.textColor = .black
        return label
    }()
    lazy var countryStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [countryImageView, countryViewlabel])
        stack.spacing = 10
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [countryStackView, buyCurrencylabel, sellCurrencylabel])
        stack.axis = .horizontal
        stack.spacing = 60
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
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
    func update(_ currency: Currency){
        self.currency = currency
        countryViewlabel.text = currency.name
        countryImageView.image = UIImage(named: currency.flag)
        buyCurrencylabel.text = "\(currency.buyNum)$"
        sellCurrencylabel.text = "\(currency.sellNum)$"
    }
}
