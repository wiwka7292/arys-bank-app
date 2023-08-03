//
//  JSONLoader.swift
//  ArysBank
//
//  Created by Жека on 02/08/2023.
//

import UIKit

protocol PaymentHistoryArchiver {
    func save(_ histories: [History])
    func retrive() -> [History]
}

final class PaymentHistoryArchiverImpl: PaymentHistoryArchiver {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Histories"
    
    func save(_ histories: [History]) {
        do {
            let data = try encoder.encode(histories)
            UserDefaults.standard.set(data, forKey:  key)
//            UserDefaults.standard.removeObject(forKey: key)

        } catch {
            print(error)
        }
    }
    
    func retrive() -> [History] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<History>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}

