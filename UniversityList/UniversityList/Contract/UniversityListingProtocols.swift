//
//  UniversityListingProtocols.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation


// MARK: - View
protocol UniversityListViewProtocol {
    
}

// MARK: - Presenter
protocol UniversityListPresenterProtocol {
    init(view: UniversityListViewProtocol,
         interactor: UniversityListInteractoreProtocol,
         router: UniversityListRouterProtocol)
    func viewDidLoad()
    func numberOfRows() -> Int
    func configureCell(_ cell: UniversityTableViewCellProtocol,_ indexPath: IndexPath)
}

// MARK: - Interactor
protocol UniversityListInteractoreProtocol {
    
}

// MARK: - Router
protocol UniversityListRouterProtocol {
    
}

// MARK: -  University Cell Protocol
protocol UniversityTableViewCellProtocol {
    func configure(with model:  UniversityCellVM)
}
