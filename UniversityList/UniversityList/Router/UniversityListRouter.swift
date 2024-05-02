//
//  UniversityListRouter.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import UIKit

class UniversityListRouter {
    // MARK: - Attributes
    weak var viewController: UIViewController?
}

extension UniversityListRouter: UniversityListRouterProtocol {
    
    // MARK: - Methods
    static func assembleModule() -> UIViewController {
        let view = UniversityListViewController()
//        let apiService = ADPSmartLicenseAPIService()
//        let remoteDataSource = ADPSmartLicenseRemoteDataSource(smartLicenseAPIService: apiService)
//        let repository = ADPSmartLicenseRepository(remoteDataSource: remoteDataSource)
//        let interactor = ADPLicenceBanDetailsInteractor(repository: repository)
        let router = UniversityListRouter()
    //    let presenter = UniversityListPresent
  //      view.presenter = presenter
    //    interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    // MARK: - Navigation
    
     func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
//    private func navigateToBack() {
//        viewController?.navigationController?.popViewController(animated: true)
//    }
}
