//
//  FinanceNewsVC.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class FinanceNewsVC: UIViewController {
    
    var financeNewsView: FinanceNewsView { self.view as! FinanceNewsView }
    
    var newsAPI = NewsAPI()
    
    override func loadView() {
        view = FinanceNewsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNews()
        
        financeNewsView.onEvent = { product in
            let controller = DetailNewsVC()
            controller.currentProduct = product
            self.present(controller, animated: true)
        }
    }
    
    func fetchNews(){
        Task {
            do {
                let news = try await newsAPI.fetchNews()
                financeNewsView.update(news)
            } catch {
                print(error)
            }
        }
    }
}
