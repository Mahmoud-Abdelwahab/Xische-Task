//
//  NetworkErrors.swift
//  MainApp
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case noInternetConnection
}
