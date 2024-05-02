//
//  UniversityListingProtocols.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation


// MARK: - View
protocol UniversityListViewProtocol: AnyObject {
    func displayUniversities()
    func showLoader()
    func hideLoader()
}

// MARK: - Presenter
protocol UniversityListPresenterProtocol {
    init(view: UniversityListViewProtocol,
         interactor: UniversityListInteractorInputProtocol,
         router: UniversityListRouterProtocol)
    func viewDidLoad()
    func numberOfRows() -> Int
    func didSelect(_ universityIndex: IndexPath)
    func configureCell(_ cell: UniversityTableViewCellProtocol,_ indexPath: IndexPath)
}

// MARK: - Interactor Input
protocol UniversityListInteractorInputProtocol {
    func fetchUniversities()
}

// MARK: - Interactor Output
protocol UniversityListInteractorOutputProtocol: AnyObject {
    func universitiesFetched(_ universities: [UniversityCellVM])
    func fetchFailed(with error: Error)
}

// MARK: - Router
public protocol UniversityListRouterProtocol {
    func showAlert(with message: String)
}

// MARK: -  University Cell Protocol
protocol UniversityTableViewCellProtocol {
    func configure(with model:  UniversityCellVM)
}

//MARK: - RealmManager
public protocol UniversityCachingProtocol {
    func saveUniversitiesToRealmDB(_ universities: [UniversityCellVM]) throws
    func fetchUniversitiesFromRealmDB() -> [UniversityCellVM]?
}

//MARK: - NetworkService
public protocol UniversityApiSeviceProtocol {
    func fetchUniversities(completion: @escaping (Result<[UniversityResponse], Error>) -> Void)
}
//MARK: - Repository
protocol UniversityRepositoryProtocol {
    typealias FetchedResult = Result<[UniversityCellVM], Error>
    func fetchUniversities(completion: @escaping (FetchedResult) -> Void)
}
