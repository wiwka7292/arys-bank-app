//
//  CardAPI.swift
//  ArysBank
//
//  Created by Жека on 16/07/2023.
//

import Foundation

class CardAPI{
    
    enum NetworkinError: Error {
        case urlInvalid
        case requeatInvalid
    }
    

//https://apingweb.com/api/rest/f7dcd48dc84f84fd865f633062092c6116/card
    func fetchCard() async throws -> [Card]{
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "apingweb.com"
        urlComponent.path = "/api/rest/f7dcd48dc84f84fd865f633062092c6116/card"
        
        guard let url = urlComponent.url else { throw NetworkinError.urlInvalid }
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        let decoder = JSONDecoder()
        
        do{
            let (data, response) = try await session.data(for: request)
            print(response)
            
            let jsonResponse = try decoder.decode(CardResponse.self, from: data)
            return jsonResponse.cart
        } catch {
            print(error)
            throw NetworkinError.requeatInvalid
        }
    }
}
