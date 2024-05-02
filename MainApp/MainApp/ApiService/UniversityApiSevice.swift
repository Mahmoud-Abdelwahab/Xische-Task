//
//  UniversityApiSevice.swift
//  List
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation
import UniversityList

public class UniversityApiSevice: UniversityApiSeviceProtocol {
    private let urlSession: URLSession
    private let baseURL = "\(Constants.baseURL)/search?country=United Arab Emirates"

    public static let shared = UniversityApiSevice()
    
    private init() {
        self.urlSession = URLSession.shared
    }
    
    
    public func fetchUniversities(completion: @escaping (Result<[UniversityList.UniversityResponse], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        let task = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let universities = try decoder.decode([UniversityResponse].self, from: data)
                completion(.success(universities))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
