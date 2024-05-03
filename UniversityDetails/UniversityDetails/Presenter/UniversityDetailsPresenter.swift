//
//  UniversityDetailsPresenter.swift
//  UniversityDetails
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import Foundation


class UniversityDetailsPresenter {
    // MARK: - Attributes
    weak var view: UniversityDetailsViewProtocol!
    var router: UniversityDetailsRouterProtocol!
    var universityDetailsModel: UniversityDetailsViewModel
    
    required init(view: UniversityDetailsViewProtocol,
                  router: UniversityDetailsRouterProtocol,
                  universityDetailsModel: UniversityDetailsViewModel) {
        self.view = view
        self.router = router
        self.universityDetailsModel = universityDetailsModel
    }
}

extension UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    
    func viewDidLoad() {
        view.displayUniversityDetails(with: universityDetailsModel)
    }
    
    func refreshButtonTapped() {
        
    }
    
    func webPageTapped() {
        guard let url = URL(string: universityDetailsModel.webPage) else { return }
        router.openSafariBrowser(with: url)
    }
}
