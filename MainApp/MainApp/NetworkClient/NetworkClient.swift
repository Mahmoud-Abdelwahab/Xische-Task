//
//  NetworkClient.swift
//  List
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation
import UniversityList

protocol NetworkClientProtocol {
    func fetchUniversities(completion: @escaping ([UniversityResponse]?, Error?) -> Void)
}

public class NetworkClient: NetworkClientProtocol {
    private let urlSession: URLSession
    private let baseURL = "\(Constants.baseURL)/search?country=United Arab Emirates"
    
    public init() {
        self.urlSession = URLSession.shared
    }
    
     func fetchUniversities(completion: @escaping ([UniversityResponse]?, Error?) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        let task = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let universities = try decoder.decode([UniversityResponse].self, from: data)
                completion(universities, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
