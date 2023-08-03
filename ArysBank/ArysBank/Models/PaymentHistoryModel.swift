//
//  PaymentHistoryModel.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

class PaymentHistoryModel{
    var name: String
    var amount: Int
    
    init(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    }
}

class HistoryService{
    var history = [
        PaymentHistoryModel(name: "Add money", amount: 123),
        PaymentHistoryModel(name: "Transfer", amount: 521),
        PaymentHistoryModel(name: "Add money", amount: 1337),
    ]
    func addObjectInArray(name: String, amount: Int){
        history.append(PaymentHistoryModel(name: name, amount: amount))
        saveAmountToUserDefaults(array: history)
    }
    func fetchHistory() -> [PaymentHistoryModel]{
        return history
    }
    
    func saveAmountToUserDefaults(array: [PaymentHistoryModel]) {
        let dictionaryArray = history.map { (paymentHistory) -> [String: Any] in
            return [
                "name": paymentHistory.name,
                "amount": paymentHistory.amount
            ]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "SavedAmount")
    }
    
    func loadAmountFromUserDefaults() {
        if let savedArray = UserDefaults.standard.value(forKey: "SavedAmount") as? [PaymentHistoryModel] {
            self.history = savedArray
        }
    }

    
}


