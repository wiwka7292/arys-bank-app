//
//  CashBackVC.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class CashBackVC: UIViewController {
    
    var cashBackView: CashBackView { self.view as! CashBackView}
    var cashBackAPI = CashBackAPI()
    override func loadView() {
        view = CashBackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCashBack()
        self.title = "CashBack"
    }
    
    func fetchCashBack(){
        Task{
            do {
                let cashBacks = try await cashBackAPI.fetchCashBack()
                cashBackView.update(cashBacks)
            }
        }
    }
}
