//
//  AppSettingsAPI.swift
//  ArysBank
//
//  Created by Жека on 03/08/2023.
//

import UIKit

class AppSettingsAPI{
    
//https://apingweb.com/api/rest/ffd96e379f4d406a67554db98af7434b16/AppSettings
    
    enum NetworkingError: Error{
        case urlInvalid
        case responseInvalid
    }
    
    func fetchDetails() async throws -> [DetailsOfSetting]{
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "apingweb.com"
        urlComponent.path = "/api/rest/ffd96e379f4d406a67554db98af7434b16/AppSettings"
        
        guard let url = urlComponent.url else { throw NetworkingError.urlInvalid}
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
        
        let decoder = JSONDecoder()
        do {
            let (data, response) = try await session.data(for: request)
            print(response)
            
            let jsonResponse = try decoder.decode(DetailsOfSettingsResponse.self, from: data)
            return jsonResponse.details
        } catch {
            print(error)
            throw NetworkingError.responseInvalid
        }
        
    }
}
