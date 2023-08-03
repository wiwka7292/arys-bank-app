//
//  AddMoneyVC.swift
//  ArysBank
//
//  Created by Жека on 21/07/2023.
//

import UIKit

class AddMoneyVC: UIViewController{
    
    var addMoneyView: AddMoneyView { self.view as! AddMoneyView}
    var card: Card?
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
        view = AddMoneyView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @objc func addCurrentAmountTapped(_ sender: UIButton) {
        let amountOfField = Int(addMoneyView.textField.text!) ?? 0
        let indexPath = IndexPath(item: 0, section: 0)
        if let cell = self.mainMenuView!.collectionView.cellForItem(at: indexPath) as? СreditСardCell {
            cell.updateValue(amountOfField)
        }
        updateHistoryList(amount: amountOfField)
        navigationController?.popViewController(animated: true)

    }
    
    func updateHistoryList(amount: Int){
        var historyList = historyArchiver.retrive()
        let item = History(amount: amount, name: "Add money")
        historyList.append(item)
        historyArchiver.save(historyList)
    }
    
}
