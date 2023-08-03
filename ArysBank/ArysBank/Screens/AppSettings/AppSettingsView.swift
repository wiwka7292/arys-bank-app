//
//  SettingsView.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class AppSettingsView: UIView{
    
    var detailsOfSetting: [DetailsOfSetting] = []
    
    var initialsLabel: UILabel = {
        var label = UILabel()
        label.text = "Evgeniy Gornostayev"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(AccountDetailCell.self, forCellReuseIdentifier: AccountDetailCell.reuseId)
        table.layer.cornerRadius = 20
        table.isScrollEnabled = false
       
        return table
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
        self.addSubview(initialsLabel)
        self.addSubview(tableView)
    }
    
    func setupConstraints(){
        initialsLabel.snp.makeConstraints { make in
            make.top.equalTo(self).inset(150)
            make.left.equalTo(self).inset(25)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(initialsLabel.snp.bottom).offset(65)
            make.left.right.equalTo(self).inset(20)
            make.height.equalTo(175)
        }
        
    }
    
    func updateSetting(detailsOfSetting: [DetailsOfSetting]){
        self.detailsOfSetting = detailsOfSetting
        tableView.reloadData()
    }
}

extension AppSettingsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsOfSetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountDetailCell.reuseId, for: indexPath) as! AccountDetailCell
        cell.selectionStyle = .none
        let detailOfSetting = detailsOfSetting[indexPath.row]
        cell.update(detailOfSetting)
        return cell
    }
    
    
}
