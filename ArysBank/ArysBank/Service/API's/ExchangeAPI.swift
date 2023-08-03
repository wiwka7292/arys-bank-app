//
//  ExchangeAPI.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import UIKit

class ExchangeAPI{
    
    
    enum NetworkError: Error {
        case urlInvalid
        case requestInvalid
    }
    
//"https://apingweb.com/api/rest/8aa8d6a4e2b8c82d355bd753ee06d11c24/currency"
    
    func getCurrency() async throws -> [Currency] {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "apingweb.com"
        urlComponents.path = "/api/rest/13a084c0bc267a9c308b80fb56948e3711/currency"
        
        guard let url = urlComponents.url else { throw NetworkError.urlInvalid }
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let decoder = JSONDecoder()
        
        do {
            let (data, response) = try await session.data(for: request)
            print(response)
            
            let jsonResponse = try decoder.decode(ExchangeCurency.self, from: data)
            return jsonResponse.curency
        } catch {
            print(error)
            throw NetworkError.requestInvalid
        }
        
    }
}
