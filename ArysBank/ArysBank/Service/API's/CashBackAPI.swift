//
//  CashBackAPI.swift
//  ArysBank
//
//  Created by Жека on 19/07/2023.
//

import UIKit

class CashBackAPI{
    
//https://apingweb.com/api/rest/a670badf89260f100ea604271d65031e10/cash-back
    
    enum NetworkingError: Error{
        case urlInvalid
        case responseInvalid
    }
    
    func fetchCashBack() async throws -> [CashBack]{
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "apingweb.com"
        urlComponent.path = "/api/rest/a670badf89260f100ea604271d65031e10/cash-back"
        
        guard let url = urlComponent.url else { throw NetworkingError.urlInvalid}
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        let decoder = JSONDecoder()
        do {
            let (data, response) = try await session.data(for: request)
            print(response)
            
            let jsonResponse = try decoder.decode(CashBackResponse.self, from: data)
            return jsonResponse.cashBack
        } catch {
            print(error)
            throw NetworkingError.responseInvalid
        }
        
    }
}
