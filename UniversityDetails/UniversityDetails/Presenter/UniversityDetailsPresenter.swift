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
    var refreshAction: (()->())?
    
    required init(view: UniversityDetailsViewProtocol,
                  router: UniversityDetailsRouterProtocol,
                  universityDetailsModel: UniversityDetailsViewModel,
                  refreshAction: @escaping () -> Void) {
        self.view = view
        self.router = router
        self.universityDetailsModel = universityDetailsModel
        self.refreshAction = refreshAction
    }
}

extension UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    
    func viewDidLoad() {
        view.displayUniversityDetails(with: universityDetailsModel)
    }
    
    func refreshButtonTapped() {
        refreshAction?()
    }
    
    func webPageTapped() {
        guard let url = URL(string: universityDetailsModel.webPage) else { return }
        router.openSafariBrowser(with: url)
    }
}
