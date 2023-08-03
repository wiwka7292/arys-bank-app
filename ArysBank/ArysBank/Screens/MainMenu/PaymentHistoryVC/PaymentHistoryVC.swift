//
//  PaymentHistoryVC.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class PaymentHistoryVC: UIViewController {
    
    var historyArchiver = PaymentHistoryArchiverImpl()
    
    
    var currentItem: History?
    
    var paymentHistoryView: PaymentHistoryView { self.view as! PaymentHistoryView}
    
    override func loadView() {
        view = PaymentHistoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(historyArchiver.retrive())
        self.title = "History"
        
    }
 
}
