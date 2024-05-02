//
//  UniversityListPresenter.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation

class UniversityListPresenter {
    
    // MARK: - Attributes
    weak var view: UniversityListViewProtocol?
    let interactor: UniversityListInteractorInputProtocol
    let router: UniversityListRouterProtocol
    var cellModels: [UniversityCellVM] = []
  
    required init(view: UniversityListViewProtocol,
                  interactor: UniversityListInteractorInputProtocol,
                  router: UniversityListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}


extension UniversityListPresenter: UniversityListPresenterProtocol {
    func viewDidLoad() {
        interactor.fetchUniversities()
    }
    
    func configureCell(_ cell: UniversityTableViewCellProtocol, _ indexPath: IndexPath) {
        let cellModel = cellModels[indexPath.row]
        cell.configure(with: cellModel)
    }
    
    func numberOfRows() -> Int {
        cellModels.count
    }
}

// MARK: - Interactore To Presenter
extension UniversityListPresenter: UniversityListInteractorOutputProtocol {
  
    
    func universitiesFetched(_ universities: [UniversityCellVM]) {
      //  view?.displayUniversities(universities)
    }
    
    func fetchFailed(with error: Error) {
        view?.displayError(error.localizedDescription)
    }
}
