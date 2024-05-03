//
//  UniversityDetailsViewController.swift
//  UniversityDetails
//
//  Created by Mahmoud Abdelwahab on 03/05/2024.
//

import UIKit

class UniversityDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var webPageLinkButton: UIButton!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    @IBOutlet weak var universityNameLabel: UILabel!
    
    // MARK: - Attributes
    var presenter: UniversityDetailsPresenterProtocol!
    
    // MARK: - Init
    public init() {
        let frameworkBundle = Bundle(for: type(of: self))
        super.init(nibName: nil, bundle: frameworkBundle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureViewContoller()
        presenter.viewDidLoad()
    }


    // MARK: - Action
    @IBAction func didTapRefreshListButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapWebLinkButton(_ sender: Any) {
        
    }
    // MARK: - Deallocation
    deinit {
        debugPrint("\(UniversityDetailsViewController.self)  released from memory 🧨")
    }
    
}

// MARK: - View Methods
extension UniversityDetailsViewController: UniversityDetailsViewProtocol {
    func displayUniversityDetails(with model: UniversityDetailsViewModel) {
        webPageLinkButton.setTitle("\(model.webPage)", for: .normal)
        countryCodeLabel.text = model.countryCode
        countryLabel.text = model.country
        universityStateLabel.text = model.stateProvince
        universityNameLabel.text = model.name
    }
}

// MARK: - Private Handlers
extension UniversityDetailsViewController {
    
    private func configureViewContoller() {
        view.backgroundColor = .systemBackground
    }
}
