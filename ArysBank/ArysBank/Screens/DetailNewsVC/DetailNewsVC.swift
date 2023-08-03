//
//  DetailNewsVC.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class DetailNewsVC: UIViewController {
    
    var currentProduct: News?
    
    
    var detailNewsView: DetailNewsView { self.view as! DetailNewsView}
    
    override func loadView() {
        view = DetailNewsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailNewsView.update(currentProduct!)
    }
}
