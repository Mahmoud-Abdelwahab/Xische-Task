//
//  UniversityListInteractorTests.swift
//  UniversityListTests
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import XCTest
@testable import UniversityList

class UniversityListInteractorTests: XCTestCase {
    // MARK: - Mocks
    
    class MockPresenter: UniversityListInteractorOutputProtocol {
        var universitiesFetchedCalled = false
        var fetchFailedCalled = false
        
        func universitiesFetched(_ universities: [UniversityCellVM]) {
            universitiesFetchedCalled = true
        }
        
        func fetchFailed(with error: Error) {
            fetchFailedCalled = true
        }
    }
    
    class MockRepository: UniversityRepositoryProtocol {
        var fetchUniversitiesCalled = false
        var fetchUniversitiesCompletion: ((FetchedResult) -> Void)?
        
        func fetchUniversities(completion: @escaping (FetchedResult) -> Void) {
            fetchUniversitiesCalled = true
            fetchUniversitiesCompletion = completion
        }
    }
    
    // MARK: - Tests
    
    func testFetchUniversities_Success() {
        // Given
        let mockPresenter = MockPresenter()
        let mockRepository = MockRepository()
        let interactor = UniversityListInteractore(universityRepository: mockRepository)
        interactor.presenter = mockPresenter
        
        // When
        interactor.fetchUniversities()
        
        // Then
        XCTAssertTrue(mockRepository.fetchUniversitiesCalled)
        XCTAssertFalse(mockPresenter.universitiesFetchedCalled)
        
        // Simulate success completion
        let universities: [UniversityCellVM] = [] // Provide test data
        mockRepository.fetchUniversitiesCompletion?(.success(universities))
        
        // Check if presenter method is called
        XCTAssertTrue(mockPresenter.universitiesFetchedCalled)
    }
    
    func testFetchUniversities_Failure() {
        // Given
        let mockPresenter = MockPresenter()
        let mockRepository = MockRepository()
        let interactor = UniversityListInteractore(universityRepository: mockRepository)
        interactor.presenter = mockPresenter
        let testError = NSError(domain: "TestError", code: 0, userInfo: nil)
        
        // When
        interactor.fetchUniversities()
        
        // Then
        XCTAssertTrue(mockRepository.fetchUniversitiesCalled)
        XCTAssertFalse(mockPresenter.fetchFailedCalled)
        
        // Simulate failure completion
        mockRepository.fetchUniversitiesCompletion?(.failure(testError))
        
        // Check if presenter method is called
        XCTAssertTrue(mockPresenter.fetchFailedCalled)
    }
}
