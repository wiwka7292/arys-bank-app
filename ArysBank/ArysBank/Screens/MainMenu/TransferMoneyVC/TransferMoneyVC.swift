//
//  TransferMoneyVC.swift
//  ArysBank
//
//  Created by Gor Zhenya on 01/08/2023.
//

import UIKit

class TransferMoneyVC: UIViewController {
    
    var transferMoneyView: TransferMoneyView { self.view as! TransferMoneyView }
    var historyArchiver = PaymentHistoryArchiverImpl()
    var currentItem: History?
    var mainMenuView: MainMenuView?
    
    init(mainMenuView: MainMenuView) {
        super.init(nibName: nil, bundle: nil)
        self.mainMenuView = mainMenuView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = TransferMoneyView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func transferAmountTapped(_ sender: UIButton) {
        let amountOfField = Int(transferMoneyView.amountTextField.text!) ?? 0
        let indexPath = IndexPath(item: 0, section: 0)
        if let cell = self.mainMenuView!.collectionView.cellForItem(at: indexPath) as? СreditСardCell {
            cell.updateValueTransfer(amountOfField)
        }
        updateHistoryList(amount: amountOfField)
        navigationController?.popViewController(animated: true)

    }
    
    func updateHistoryList(amount: Int){
        var historyList = historyArchiver.retrive()
        let item = History(amount: amount, name: "Transfer")
        historyList.append(item)
        historyArchiver.save(historyList)
    }

}
