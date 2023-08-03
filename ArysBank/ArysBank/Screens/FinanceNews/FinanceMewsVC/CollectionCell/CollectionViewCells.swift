//
//  CollectionViewCells.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class FinanceNewsCell: UICollectionViewCell {
    
    static var reuseId = "FinanceNewsCell"
    
    var onNewsCellTapped: ((News)->())?
    
    var news: News?
    
    var buttonView: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(productCellTapped), for: .touchUpInside)
        return button
    }()
    
    var imageViews: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "")
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.55 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.85 * width).isActive = true
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    var textLabel: UILabel = {
        var label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [ imageViews, titleLabel, textLabel])
        stack.axis = .vertical
        stack.layer.cornerRadius = 15
        stack.clipsToBounds = true
        stack.isLayoutMarginsRelativeArrangement = true
        stack.spacing = 10
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
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
        contentView.addSubview(buttonView)
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        buttonView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func update(_ news: News){
        self.news = news
        titleLabel.text = news.title
        textLabel.text = news.text
        imageViews.image = UIImage(named: news.image)
    }
    
    @objc func productCellTapped(sender: UIButton) {
        onNewsCellTapped?(news!)
    }
}
