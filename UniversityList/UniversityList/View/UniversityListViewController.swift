//
//  UniversityListViewController.swift
//  UniversityList
//
//  Created by Mahmoud Abdelwahab on 02/05/2024.
//

import UIKit

public class UniversityListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var universityTableView: UITableView!
    
    // MARK: - Attributes
    var presenter: UniversityListPresenterProtocol!

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

extension UniversityListViewController {
    
    private func configureViewContoller() {
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView() {
        universityTableView
    }
}


extension UniversityListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityTableViewCell") as?  UniversityTableViewCell else { return UITableViewCell()}
        presenter.configureCell(cell, indexPath)
        return cell
    }
}
