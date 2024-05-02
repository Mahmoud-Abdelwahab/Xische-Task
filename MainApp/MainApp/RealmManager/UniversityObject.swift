//
//  UniversityObject.swift
//  MainApp
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation
import RealmSwift

class UniversityObject: Object  {
    @objc dynamic var name: String = ""
    @objc dynamic var stateProvince: String?
    let webPages = List<String>()
    @objc dynamic var alphaTwoCode: String = ""
    @objc dynamic var country: String = ""
}
