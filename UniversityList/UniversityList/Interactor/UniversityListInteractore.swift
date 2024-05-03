//
//  UniversityListInteractore.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation

class UniversityListInteractore {
    weak var presenter: UniversityListInteractorOutputProtocol?
    var universityRepository: UniversityRepositoryProtocol
    
    init(universityRepository: UniversityRepositoryProtocol) {
        self.universityRepository = universityRepository
    }
}

//MARK: - Input Methods
extension UniversityListInteractore : UniversityListInteractorInputProtocol {
    func fetchUniversities() {
        universityRepository.fetchUniversities { result in
            switch result {
            case .success(let universities):
                self.presenter?.universitiesFetched(universities)
            case .failure(let error):
                self.presenter?.fetchFailed(with: error)
            }
        }
    }
}

