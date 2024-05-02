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
    var cellVMs: [UniversityCellVM] = []
  
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
        view?.showLoader()
        interactor.fetchUniversities()
    }
    
    func configureCell(_ cell: UniversityTableViewCellProtocol, _ indexPath: IndexPath) {
        let cellModel = cellVMs[indexPath.row]
        cell.configure(with: cellModel)
    }
    
    func numberOfRows() -> Int {
        cellVMs.count
    }
    
    func didSelect(_ universityIndex: IndexPath) {
        let cellModel = cellVMs[universityIndex.row]
        print("🚀", cellModel)
    }
}

// MARK: - Interactore To Presenter
extension UniversityListPresenter: UniversityListInteractorOutputProtocol {

    func universitiesFetched(_ universities: [UniversityCellVM]) {
        view?.hideLoader()
        cellVMs = universities
        view?.displayUniversities()
    }
    
    func fetchFailed(with error: Error) {
        view?.hideLoader()
        router.showAlert(with: error.localizedDescription)
    }
}
