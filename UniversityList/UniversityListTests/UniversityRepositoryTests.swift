//
//  UniversityRepositoryTests.swift
//  UniversityListTests
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import XCTest
@testable import UniversityList

class UniversityRepositoryTests: XCTestCase {
        
    class MockUniversityApiService: UniversityApiSeviceProtocol {
        func fetchUniversities(completion: @escaping (Result<[UniversityResponse], Error>) -> Void) {
        }
    }
    
    class MockUniversityCaching: UniversityCachingProtocol {
        func fetchUniversitiesFromRealmDB() -> [UniversityCellVM]? {
            return nil
        }
        
        func saveUniversitiesToRealmDB(_ universities: [UniversityCellVM]) throws {
        }
    }
    
    // Test case for fetching universities from API
    
    func testFetchUniversitiesFromAPI() {
        // Arrange
        let mockApiService = MockUniversityApiService()
        let mockRealm = MockUniversityCaching()
        let repository = UniversityRepository(universityApiSevice: mockApiService, realm: mockRealm)
        let expectation = XCTestExpectation(description: "Fetch universities from API")
        
        // Act
        repository.fetchUniversities { result in
            // Assert
            switch result {
            case .success(let universities):
                // Verify that universities are fetched successfully
                XCTAssertNotNil(universities)
                expectation.fulfill()
            case .failure(let error):
                // Handle failure case
                XCTFail("Failed to fetch universities from API: \(error.localizedDescription)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
