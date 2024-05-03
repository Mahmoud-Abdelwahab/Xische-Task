//
//  UniversityDetailsProtocols.swift
//  UniversityDetails
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import Foundation
import UniversityList

// MARK: - View
protocol UniversityDetailsViewProtocol: AnyObject {
    func displayUniversityDetails(with model: UniversityDetailsViewModel)
}

// MARK: - Presenter
protocol UniversityDetailsPresenterProtocol {
    init(view: UniversityDetailsViewProtocol,
         router: UniversityDetailsRouterProtocol,
         universityDetailsModel: UniversityDetailsViewModel)
    func viewDidLoad()
    func refreshButtonTapped()
    func webPageTapped()
}

// MARK: - Router
public protocol UniversityDetailsRouterProtocol {
    func openSafariBrowser(with webPageUrl: URL)
}
