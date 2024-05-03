//
//  UniversityListViewController.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import UIKit
// MARK: - Outlets
// MARK: - Attributes
public class UniversityListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var universityTableView: UITableView!
    @IBOutlet weak var activityIndicatore: UIActivityIndicatorView!
    
    // MARK: - Attributes
    var presenter: UniversityListPresenterProtocol!
    
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
    
    // MARK: - Deallocation
    deinit {
        debugPrint("\(UniversityListViewController.self)  released from memory 🧨")
    }
    
}


// MARK: - View Methods
extension UniversityListViewController: UniversityListViewProtocol {
    
    func showLoader() {
        activityIndicatore.startAnimating()
    }
    
    func hideLoader() {
        activityIndicatore.stopAnimating()
    }
    
    func displayUniversities() {
        universityTableView.reloadData()
    }
}

// MARK: - Private Handlers
extension UniversityListViewController {
    
    private func configureViewContoller() {
        title = "UAE University List"
        view.backgroundColor = .systemBackground
        activityIndicatore.hidesWhenStopped = true
        configureTableView()
    }
    
    private func configureTableView() {
        universityTableView.delegate = self
        universityTableView.dataSource = self
        let frameworkBundle = Bundle(for: type(of: self))
        universityTableView.register(UINib(nibName: "UniversityTableViewCell", bundle: frameworkBundle), forCellReuseIdentifier: "UniversityTableViewCell")
        
    }
}

// MARK: - TableView DataSource
extension UniversityListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell") as?  UniversityTableViewCell else { return UITableViewCell()}
        cell.accessoryType = .disclosureIndicator
        presenter.configureCell(cell, indexPath)
        return cell
    }
}

// MARK: - TableView Delegate Method
extension UniversityListViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(indexPath)
    }
}
