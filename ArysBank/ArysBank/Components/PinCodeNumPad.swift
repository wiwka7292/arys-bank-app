//
//  PinCodeNumPad.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import UIKit

class PinCodeNumPad: UIControl {
    
    var oneNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
    
        return button
    }()
    
    var twoNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var threeNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var fourNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var fiveNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var sixNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var sevenNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var eightNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var nineNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var zeroNumButton: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    var emptyNumButton: UIButton = {
        let button = UIButton()
        button.setTitle(" ", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        return button
    }()
    
    var deleteNumButton: UIButton = {
        var button = UIButton()
        let config = UIImage.SymbolConfiguration(
            pointSize: 35, weight: .medium, scale: .default)
        let image = UIImage(systemName: "delete.left", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 45)
        return button
    }()
    
    lazy var stackFirstLineView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [oneNumButton, twoNumButton, threeNumButton])
        stack.spacing = 60
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var stackSecondLineView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [fourNumButton, fiveNumButton, sixNumButton])
        stack.spacing = 60
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var stackThirdLineView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [sevenNumButton, eightNumButton, nineNumButton])
        stack.spacing = 60
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var stackFourLineView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [zeroNumButton, deleteNumButton])
        stack.spacing = 44
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var stackVerticalView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [stackFirstLineView, stackSecondLineView, stackThirdLineView])
        stack.spacing = 25
        stack.axis = .vertical
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
        
        self.addSubview(stackVerticalView)
        self.addSubview(stackFourLineView)
        
    }
    
    func setupConstraints(){
        stackVerticalView.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        stackFourLineView.snp.makeConstraints { make in
            make.right.equalTo(stackVerticalView.snp.right)
            make.top.equalTo(stackVerticalView.snp.bottom).offset(20)
        }
        
    }
    
}
