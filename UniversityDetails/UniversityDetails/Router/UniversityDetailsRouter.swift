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
    public static func assembleModule(universityDetailsModel: UniversityDetailsViewModel, refreshAction: @escaping () -> Void) -> UIViewController {
        let view = UniversityDetailsViewController()
        let router = UniversityDetailsRouter()
        let presenter = UniversityDetailsPresenter(view: view,
                                                   router: router,
                                                   universityDetailsModel: universityDetailsModel, refreshAction: refreshAction)
        view.presenter = presenter
        
        router.viewController = view
        
        return view
    }
    
    // MARK: - Navigation
    
    public func dismiss() {
        viewController?.dismiss(animated: true)
    }
    
    public func openSafariBrowser(with webPageUrl: URL) {
        UIApplication.shared.open(webPageUrl)
    }
}
