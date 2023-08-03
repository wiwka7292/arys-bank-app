//
//  DetailNewsView.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit
import SnapKit

class DetailNewsView: UIView {
    
    var imageView: UIImageView = {
        var image = UIImageView()
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 350).isActive = true
        image.widthAnchor.constraint(equalToConstant: width).isActive = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var titleView: UILabel = {
        var label = UILabel()
        label.text = "Деревенская с бужениной"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var detailPizza: UILabel = {
        var label = UILabel()
        label.text = "Запеченная буженина из свинины,моцарелла,картофель из печи,маринованные огурчики,красный лук,чеснок,фирменный томатный соус,соус ранч"
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    var scrollView = UIScrollView()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [imageView, titleView, detailPizza])
        stack.axis = .vertical
        stack.spacing = 20
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        scrollView.addSubview(stackView)
        self.addSubview(scrollView)
    }
    
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
    }
    
    func update(_ product: News){
        imageView.image = UIImage(named: product.image)
        titleView.text = product.title
        detailPizza.text = product.text
    }
}
