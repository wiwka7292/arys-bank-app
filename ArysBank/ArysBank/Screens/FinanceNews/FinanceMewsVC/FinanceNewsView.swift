//
//  FinanceNewsView.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class FinanceNewsView: UIView {
    
    var news: [News] = []
    
    var onEvent: ((News)->())?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
        layout.itemSize = CGSize(width: cellSize, height: 350)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        collectionView.register(FinanceNewsCell.self, forCellWithReuseIdentifier: FinanceNewsCell.reuseId)
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
            make.edges.equalTo(self)
        }
        
    }
    
    func update(_ news: [News]){
        self.news = news
        collectionView.reloadData()
    }
}

extension FinanceNewsView: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinanceNewsCell.reuseId, for: indexPath) as! FinanceNewsCell
        let news = news[indexPath.row]
        cell.update(news)
        cell.layer.cornerRadius = 15
        cell.onNewsCellTapped = { news in
            self.onEvent?(news)
        }
        return cell
    }
    
    
}
