//
//  UniversityRepositoryProtocol.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import Foundation


class UniversityRepository {
    private let networkClient: NetworkClientProtocol
    private let realm: UniversityCachingProtocol
    
    init(networkClient: NetworkClientProtocol, realm: UniversityCachingProtocol) {
        self.networkClient = networkClient
        self.realm = realm
    }
}


extension  UniversityRepository: UniversityRepositoryProtocol{
    func fetchUniversities(completion: @escaping (FetchedResult) -> Void) {
        if Reachability.shared.isConnectedToNetwork() {
            networkClient.fetchUniversities { result  in
                switch result {
                case .success(let response):
                    let universityCellViewModel = self.mapToViewModel(response: response)
                    completion(.success(universityCellViewModel))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            guard let universities = fetchUniversitiesFromRealm() else {
                completion(.failure(NSError(domain: "No cached data", code: 0, userInfo: nil)))
                return
            }
            completion(.success(universities))
        }
    }
    
    private func mapToViewModel(response: [UniversityResponse])-> [UniversityCellVM] {
       let universityCellViewModel =  response.map {
            $0.toUniversityCellVM()
        }
        self.saveUniversitiesToRealm(universityCellViewModel)
        return universityCellViewModel
    }
    
    private func saveUniversitiesToRealm(_ universities: [UniversityCellVM])  {
        do {
            try realm.cachingUniversitiesFromCache(universities)
        } catch {
            debugPrint(error)
        }
    }
 
    private func fetchUniversitiesFromRealm() -> [UniversityCellVM]? {
        let universityObjects = realm.objects(UniversityObject.self)
        return Array(universityObjects).map { universityObject in
            University(
                name: universityObject.name,
                stateProvince: universityObject.stateProvince,
                domains: Array(universityObject.domains),
                webPages: Array(universityObject.webPages),
                alphaTwoCode: universityObject.alphaTwoCode,
                country: universityObject.country
            )
        }
    }
}
