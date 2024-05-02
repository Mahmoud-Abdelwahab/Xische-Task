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
    static func assembleModule(universityApiService: UniversityApiSeviceProtocol,
                               realmManager: UniversityCachingProtocol) -> UIViewController {
        let view = UniversityListViewController()
        let repository = UniversityRepository(universityApiSevice: universityApiService, realm: realmManager)
        let interactor = UniversityListInteractore(universityRepository: repository)
        let router = UniversityListRouter()
        let presenter = UniversityListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
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
