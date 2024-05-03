//
//  AppRouter.swift
//  MainApp
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import UIKit
import UniversityList
import UniversityDetails

class AppRouter {
    static func start(window: UIWindow?) {
        guard let window = window else {
            fatalError("Window is nil")
        }
        let universityApiService = UniversityApiSevice.shared
        let realmManager = RealmManager.shared
        let initialViewController = UniversityDetailsRouter.assembleModule(universityDetailsModel: UniversityDetailsViewModel(name: "Abu dahab", stateProvince: "aboooo", webPage: "https://github.com/Mahmoud-Abdelwahab/XschieTask", countryCode: "UAE", country: "United arab Emirate"))
        //UniversityListRouter.assembleModule(universityApiService: universityApiService, realmManager: realmManager)
        
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}


