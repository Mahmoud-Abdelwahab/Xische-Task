//
//  UniversityCellVM.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation

public struct UniversityCellVM {
    public let name: String
    public let stateProvince: String
    public let webPage: String
    public let countryCode: String
    public let country: String
    
    public init(name: String, stateProvince: String, webPage: String, countryCode: String, country: String) {
        self.name = name
        self.stateProvince = stateProvince
        self.webPage = webPage
        self.countryCode = countryCode
        self.country = country
    }
}
