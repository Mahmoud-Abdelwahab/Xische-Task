//
//  UniversityListRouter.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import UIKit

public class UniversityListRouter {
    // MARK: - Attributes
    weak var viewController: UIViewController?
    weak var mainAppRouter: UniversityListRouterProtocol? // Add a property to store the main app's router
    
    init(mainAppRouter: UniversityListRouterProtocol) {
        self.mainAppRouter = mainAppRouter
    }
}

extension UniversityListRouter: UniversityListRouterProtocol {
    
    // MARK: - Methods
    public static func assembleModule(universityApiService: UniversityApiSeviceProtocol,
                                      realmManager: UniversityCachingProtocol,
                                      mainAppRouter: UniversityListRouterProtocol) -> UIViewController {
        let view = UniversityListViewController()
        let repository = UniversityRepository(universityApiSevice: universityApiService, realm: realmManager)
        let interactor = UniversityListInteractore(universityRepository: repository)
        let router = UniversityListRouter(mainAppRouter: mainAppRouter)
        let presenter = UniversityListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    // MARK: - Navigation
    
    public func showAlert(with message: String) {
        mainAppRouter?.showAlert(with: message)
    }
    
    public func navigateToDetailsScreen(with model: UniversityCellVM) {
        mainAppRouter?.navigateToDetailsScreen(with: model)
    }
}
