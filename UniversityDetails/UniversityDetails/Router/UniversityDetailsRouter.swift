//
//  UniversityDetailsRouter.swift
//  UniversityDetails
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import UIKit

public class UniversityDetailsRouter {
    // MARK: - Attributes
    weak var viewController: UIViewController?
}

extension UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    
    
    // MARK: - Methods
    public static func assembleModule(universityDetailsModel: UniversityDetailsViewModel) -> UIViewController {
        let view = UniversityDetailsViewController()
        let router = UniversityDetailsRouter()
        let presenter = UniversityDetailsPresenter(view: view,
                                                   router: router,
                                                   universityDetailsModel: universityDetailsModel)
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    // MARK: - Navigation
    
    private func navigateToBack() {
        viewController?.navigationController?.dismiss(animated: true)
    }
    
    public func openSafariBrowser(with webPageUrl: URL) {
         UIApplication.shared.open(webPageUrl)
    }
}
