//
//  NetworkService.swift
//  SuperHeroAPI
//
//  Created by Casper Lefevre on 13/03/2024.
//

import Foundation

class NetworkService {
    static func fetchData(from url: URL) async -> Data? {
        var returnData: Data?
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else{ return nil }
            if httpResponse.statusCode == 200 {
                returnData = data
            }else {
                fatalError("NetworkError")
            }
        }
        catch{
            fatalError("Fejl i sessionData download")
        }
        return returnData
    }
}
