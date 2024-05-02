//
//  UniversityListingProtocols.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation


// MARK: - View
protocol UniversityListViewProtocol: AnyObject {
   // func displayUniversities(_ universities: [University])
    func displayError(_ errorMessage: String)
}

// MARK: - Presenter
protocol UniversityListPresenterProtocol {
    init(view: UniversityListViewProtocol,
         interactor: UniversityListInteractorInputProtocol,
         router: UniversityListRouterProtocol)
    func viewDidLoad()
    func numberOfRows() -> Int
    func configureCell(_ cell: UniversityTableViewCellProtocol,_ indexPath: IndexPath)
}

// MARK: - Interactor
protocol UniversityListInteractorInputProtocol {
    func fetchUniversities()
}

protocol UniversityListInteractorOutputProtocol: AnyObject {
    func universitiesFetched(_ universities: [UniversityCellVM])
    func fetchFailed(with error: Error)
}

// MARK: - Router
protocol UniversityListRouterProtocol {
    
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
public protocol NetworkClientProtocol {
    func fetchUniversities(completion: @escaping (Result<[UniversityResponse], Error>) -> Void)
}
//MARK: - Repository
protocol UniversityRepositoryProtocol {
    typealias FetchedResult = Result<[UniversityCellVM], Error>
    func fetchUniversities(completion: @escaping (FetchedResult) -> Void)
}
