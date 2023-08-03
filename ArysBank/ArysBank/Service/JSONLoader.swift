////
////  JSONLoader.swift
////  ArysBank
////
////  Created by Жека on 02/08/2023.
////
//
//import Foundation
//
//
//
//
//final class JsonLoader {
//
//    //Файл menu.json который лежит в песочнице > [ProductModel]
//    func loadProducts(filename: String) -> [History]? {
//        
//        //Получаем путь файла из песочницы
//        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)//выгружаем контент из файла JSON по пути url в некую бинарный тип данных
//                
//                // декодируем(пассинг,maping) бинарный JSON модель данных
//                let jsonData = try JSONDecoder().decode(HistoryModel.self, from: data)
//                return jsonData.histories
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
//}
//
