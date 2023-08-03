//
//  PaymentHistoryView.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class PaymentHistoryView: UIView {
    
    var histories: [History] = []

    var historyArchiver = PaymentHistoryArchiverImpl()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(PaymentHistoryCell.self, forCellReuseIdentifier: PaymentHistoryCell.reuseId)
        table.isScrollEnabled = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .systemGray6
        histories = historyArchiver.retrive()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        self.addSubview(tableView)
    }
    
    func setupConstraints(){
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(self).inset(100)
        }
        
    }
    
    func update(histories: [History]) {
        self.histories = histories
        
    }

}

extension PaymentHistoryView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PaymentHistoryCell.reuseId, for: indexPath) as! PaymentHistoryCell
        let product = histories[indexPath.row]
        cell.update(product)
        cell.selectionStyle = .none
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
    
    
}
