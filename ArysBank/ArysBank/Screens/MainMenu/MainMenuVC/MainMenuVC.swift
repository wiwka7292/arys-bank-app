//
//  ViewController.swift
//  ArysBank
//
//  Created by Жека on 15/07/2023.
//

import UIKit

class MainMenuVC: UIViewController {
    
    var mainMenuView: MainMenuView { self.view as! MainMenuView }
    var exchangeAPI = ExchangeAPI()
    var cardAPI = CardAPI()
    var appSettingsApi = AppSettingsAPI()
    override func loadView() {
        view = MainMenuView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurreny()
        fetchCard()
        showLogoPreView()
        navigationController?.navigationBar.tintColor = UIColor.red
    }
    
    func fetchCurreny() {
        Task {
            do{
                let currencies = try await exchangeAPI.getCurrency()
                mainMenuView.updateCurrency(currencies: currencies)
                
            }catch{
                print(error)
            }
        }
    }
    
    func fetchCard(){
        Task {
            do{
                let cards = try await cardAPI.fetchCard()
                mainMenuView.updateCard(cards: cards)
            }catch{
                print(error)
            }
        }
    }
 
    
    
    
    @objc func goCashBackButtonTapped(){
        let cashBackVC = CashBackVC()
        cashBackVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(cashBackVC, animated: true)
    }
    @objc func paymentHistoryButtonTapped(){
        let paymentHistoryVC = PaymentHistoryVC()
        paymentHistoryVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(paymentHistoryVC, animated: true)
    }
    @objc func transferMoneyButtonTapped(){
        let transferMoneyVC = TransferMoneyVC(mainMenuView: mainMenuView)
        transferMoneyVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(transferMoneyVC, animated: true)
    }
    @objc func addMoneyButtonTapped() {
        let addMoneyVC = AddMoneyVC(mainMenuView: mainMenuView)
        addMoneyVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addMoneyVC, animated: true)
    }
    
    func showLogoPreView(){
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.fadeOutView()
            self.tabBarController?.tabBar.isHidden = false
            self.navigationController?.isNavigationBarHidden = false

        }
        
    }
    
    func fadeOutView() {
        UIView.animate(withDuration: 1.2, animations: {
            self.mainMenuView.logoPreView.alpha = 0.0
        }) { _ in
            self.mainMenuView.logoPreView.isHidden = true
        }
    }
    
}

