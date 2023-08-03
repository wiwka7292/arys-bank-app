//
//  MainMenuView.swift
//  ArysBank
//
//  Created by Жека on 15/07/2023.
//

import UIKit
import SnapKit

class MainMenuView: UIView {
    
    var currencies: [Currency] = []
    
    var cards: [Card] = []

    var logoPreView = LogoPreView()


    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemsCount: CGFloat = 1
        let padding: CGFloat = 20
        let paddingCount: CGFloat = itemsCount
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount - 10
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: 15, bottom: padding, right: 15)
        layout.itemSize = CGSize(width: cellSize, height: 210)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        collectionView.register(СreditСardCell.self, forCellWithReuseIdentifier: СreditСardCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsFocus = true
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(ExchangeRatesViewCell.self, forCellReuseIdentifier: ExchangeRatesViewCell.reuseId)
        table.layer.cornerRadius = 15
        table.isScrollEnabled = false
        return table
    }()
    
    lazy var stackCurrencyView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [tableView])
        stack.axis = .vertical
        return stack
    }()
    
    var transferMoneyButton = FactoryComp().createButton(icon: "transferMoney", target: #selector(MainMenuVC.transferMoneyButtonTapped))
    var addMoneyButton = FactoryComp().createButton(icon: "addMoney", target: #selector(MainMenuVC.addMoneyButtonTapped))
    var safeMoneyButton = FactoryComp().createButton(icon: "history", target: #selector(MainMenuVC.paymentHistoryButtonTapped))
    var cashBackButton = FactoryComp().createButton(icon: "cashBack", target: #selector(MainMenuVC.goCashBackButtonTapped))

    lazy var stackFuntionsView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [addMoneyButton, transferMoneyButton, safeMoneyButton, cashBackButton])
        stack.axis = .horizontal
        stack.layer.cornerRadius = 20
        stack.backgroundColor = .white
        stack.distribution = .fillEqually
        stack.spacing = 15
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stack
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
    
    func updateCurrency(currencies: [Currency]) {
        self.currencies = currencies
        tableView.reloadData()
    }
    
    func updateCard(cards: [Card]){
        self.cards = cards
        collectionView.reloadData()
    }
    
    func setupViews(){
        self.addSubview(collectionView)
        self.addSubview(stackCurrencyView)
        self.addSubview(stackFuntionsView)
        self.addSubview(logoPreView)
    }
    
    func setupConstraints(){
        collectionView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(self).inset(100)
            make.bottom.equalTo(self).inset(450)
        }
        
        stackFuntionsView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(15)
            make.top.equalTo(collectionView).inset(290)
            make.height.equalTo(80)
        }
        
        
        stackCurrencyView.snp.makeConstraints { make in
            make.top.equalTo(stackFuntionsView.snp.bottom).offset(40)
            make.right.left.equalTo(self).inset(15)
            make.bottom.equalTo(self).inset(103)
        }
        
        logoPreView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
    }
    
    
    
   }

extension MainMenuView: UICollectionViewDelegate, UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: СreditСardCell.reuseId, for: indexPath) as! СreditСardCell
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.red.cgColor
        cell.layer.shadowOpacity = 0.9
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 15
        let card = cards[indexPath.row]
        cell.update(card)
        return cell
    }
    
    
}

extension MainMenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeRatesViewCell.reuseId, for: indexPath) as! ExchangeRatesViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .white.withAlphaComponent(0.1)
        let currency = currencies[indexPath.row]
        cell.update(currency)
        return cell
    }
    
    
}

