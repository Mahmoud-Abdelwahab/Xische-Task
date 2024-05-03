//
//  UniversityDetailsPresenterTests.swift
//  UniversityDetailsTests
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import XCTest
@testable import UniversityDetails

class UniversityDetailsPresenterTests: XCTestCase {
    
    // MARK: - Mocks
    
    class MockView: UniversityDetailsViewProtocol {
        var displayedUniversityDetails: UniversityDetailsViewModel?
        
        func displayUniversityDetails(with model: UniversityDetailsViewModel) {
            displayedUniversityDetails = model
        }
    }
    
    class MockRouter: UniversityDetailsRouterProtocol {
        var dismissed = false
        var openedURL: URL?
        
        func dismiss() {
            dismissed = true
        }
        
        func openSafariBrowser(with url: URL) {
            openedURL = url
        }
    }
    
    // MARK: - Tests
    
    func testViewDidLoad() {
        // Given
        let mockView = MockView()
        let presenter = UniversityDetailsPresenter(view: mockView, router: MockRouter(), universityDetailsModel: UniversityDetailsViewModel(name: "Test University", stateProvince: "Test State", webPage: "https://www.test.com", countryCode: "US", country: "United States"), refreshAction: {})
        
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertNotNil(mockView.displayedUniversityDetails)
        XCTAssertEqual(mockView.displayedUniversityDetails?.name, "Test University")
    }
    
    func testRefreshButtonTapped() {
        // Given
        let mockRouter = MockRouter()
        let presenter = UniversityDetailsPresenter(view: MockView(), router: mockRouter, universityDetailsModel: UniversityDetailsViewModel(name: "Test University", stateProvince: "Test State", webPage: "https://www.test.com", countryCode: "US", country: "United States"), refreshAction: {})
        
        // When
        presenter.refreshButtonTapped()
        
        // Then
        XCTAssertTrue(mockRouter.dismissed)
    }
    
    func testWebPageTapped() {
        // Given
        let mockRouter = MockRouter()
        let presenter = UniversityDetailsPresenter(view: MockView(), router: mockRouter, universityDetailsModel: UniversityDetailsViewModel(name: "Test University", stateProvince: "Test State", webPage: "https://www.test.com", countryCode: "US", country: "United States"), refreshAction: {})
        
        // When
        presenter.webPageTapped()
        
        // Then
        XCTAssertEqual(mockRouter.openedURL, URL(string: "https://www.test.com"))
    }
}
