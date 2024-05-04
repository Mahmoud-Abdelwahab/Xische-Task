//
//  UniversityRepositoryProtocol.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation


class UniversityRepository {
    private let remoteApiSevice: UniversityApiSeviceProtocol
    private let localStorage: UniversityCachingProtocol
    
    init(universityApiSevice: UniversityApiSeviceProtocol, realm: UniversityCachingProtocol) {
        self.remoteApiSevice = universityApiSevice
        self.localStorage = realm
    }
}


extension  UniversityRepository: UniversityRepositoryProtocol{
    func fetchUniversities(completion: @escaping (FetchedResult) -> Void) {
        if Reachability.shared.isConnectedToNetwork() {
            remoteApiSevice.fetchUniversities { [weak self] result  in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        self.handleSuccess(completion: completion, response: response)
                    case .failure(let error):
                        self.handleNetworkFailure(completion: completion, error: error)
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                let error = NSError(domain: "❌ No Internet and No cached data ❌", code: 0, userInfo: nil)
                self.handleNetworkFailure(completion: completion, error: error)
            }
        }
    }
    
    private func handleSuccess(completion: @escaping (FetchedResult) -> Void, response: [UniversityResponse]) {
        let universityCellViewModel = self.mapToViewModel(response: response)
        completion(.success(universityCellViewModel))
    }
    
    private func handleNetworkFailure(completion: @escaping (FetchedResult) -> Void, error: Error) {
        guard let universities = self.fetchUniversitiesFromRealm(), !universities.isEmpty else {
            completion(.failure(error))
            return
        }
        completion(.success(universities))
    }
}

//MARK: - Private Handlers
extension  UniversityRepository {
    private func mapToViewModel(response: [UniversityResponse])-> [UniversityCellVM] {
        let universityCellViewModel =  response.map {
            $0.toUniversityCellVM()
        }
        self.saveUniversitiesToRealm(universityCellViewModel)
        return universityCellViewModel
    }
    
    private func saveUniversitiesToRealm(_ universities: [UniversityCellVM])  {
        do {
            try localStorage.saveUniversitiesToRealmDB(universities)
        } catch {
            debugPrint(error)
        }
    }
    
    private func fetchUniversitiesFromRealm() -> [UniversityCellVM]? {
        localStorage.fetchUniversitiesFromRealmDB()
    }
}
