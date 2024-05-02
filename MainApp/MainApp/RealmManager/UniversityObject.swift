//
//  UniversityObject.swift
//  MainApp
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation
import RealmSwift
import UniversityList

class UniversityObject: Object  {
    @objc dynamic var name: String = ""
    @objc dynamic var stateProvince: String?
    @objc dynamic var webPage: String?
    @objc dynamic var alphaTwoCode: String = ""
    @objc dynamic var country: String = ""
}

extension UniversityObject {
    func toUniversityCellVM() -> UniversityCellVM {
        UniversityCellVM(name: self.name,
                         stateProvince: self.stateProvince ?? "- - -",
                         webPage: self.webPage ?? "- - -",
                         countryCode: self.alphaTwoCode,
                         country: self.country)
    }
}
