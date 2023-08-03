//
//  CashBackView.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class CashBackView: UIView{
    
    var cashBacks: [CashBack] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let itemsCount: CGFloat = 2
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
        collectionView.register(CashBackCell.self, forCellWithReuseIdentifier: CashBackCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.allowsFocus = true
        collectionView.isScrollEnabled = true
        return collectionView
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
        self.addSubview(collectionView)
    }
    
    func setupConstraints(){
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaInsets)
        }
    }
    func update(_ cashBack: [CashBack]){
        self.cashBacks = cashBack
        collectionView.reloadData()
    }
    
    
}

extension CashBackView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cashBacks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CashBackCell.reuseId, for: indexPath) as! CashBackCell
        let cashBack = cashBacks[indexPath.row]
        cell.update(cashBack)
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    
    
}

