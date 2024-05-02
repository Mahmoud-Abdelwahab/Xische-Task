//
//  UniversityResponse.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation

public struct UniversityResponse: Decodable {
    public let name: String
    public let stateProvince: String?
    public let webPages: [String]
    public let alphaTwoCode: String
    public let country: String
    
    private enum CodingKeys: String, CodingKey {
           case name, webPages, alphaTwoCode, country
           case stateProvince = "state-province"
       }
}

extension UniversityResponse {
    func toUniversityCellVM() -> UniversityCellVM {
        UniversityCellVM(name: self.name,
                         stateProvince: self.stateProvince ?? "- - -",
                         webPage: self.webPages.first ?? "",
                         countryCode: self.alphaTwoCode,
                         country: self.country)
    }
}
