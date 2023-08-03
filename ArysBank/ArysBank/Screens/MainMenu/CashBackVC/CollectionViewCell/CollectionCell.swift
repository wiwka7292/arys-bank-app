//
//  CollectionCell.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class CashBackCell: UICollectionViewCell {
    
    static var reuseId = "CashBackCell"
    
    var cashBack: CashBack?
    
    var logoBrandView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "nike")
        let width = UIScreen.main.bounds.width
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: 0.4 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.4 * width).isActive = true
        return image
    }()
    
    var procentCashBack: UILabel = {
        var label = UILabel()
        label.text = "12%"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [logoBrandView, procentCashBack])
        stack.axis = .vertical
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.alignment = .center
        stack.backgroundColor = .white
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    func update(_ cashBack: CashBack){
        self.cashBack = cashBack
        procentCashBack.text = cashBack.text + "%"
        logoBrandView.image = UIImage(named: cashBack.image)
    }
}
