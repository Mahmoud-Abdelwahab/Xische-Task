//
//  UniversityDetailsViewModel.swift
//  UniversityDetails
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import Foundation

public struct UniversityDetailsViewModel {
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
