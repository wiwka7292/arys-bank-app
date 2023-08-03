//
//  AccountDetailCell.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class AccountDetailCell: UITableViewCell {
    
    static let reuseId = "AccountDetailCell"
    
    var detailsOfSetting: DetailsOfSetting?
    
    var nameSettingsSection: UILabel = {
        var label = UILabel()
        label.text = "name"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    var statusOfSectin: UILabel = {
        var label = UILabel()
        label.text = "none"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [nameSettingsSection, statusOfSectin])
        stack.axis = .horizontal
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
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
            make.edges.equalTo(self)
        }
        
    }

    func update(_ detailsOfSetting: DetailsOfSetting){
        self.detailsOfSetting = detailsOfSetting
        nameSettingsSection.text = detailsOfSetting.nameOfSection
        statusOfSectin.text = detailsOfSetting.statusOfSection
    }
    
}
