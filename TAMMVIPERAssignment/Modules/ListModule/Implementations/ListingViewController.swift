//
//  ListingViewController.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import UIKit

class ListingViewController: UIViewController, ListingView {
    
    var presenter: ListingPresenterImp?
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureNavigationBar()
        self.configureTableView()
        self.title = "Home"
    }
    
    
    func configureTableView() {
        self.tableView.registerNib(from: UniversityTableViewCell.self)
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableView.automaticDimension
        setupRefreshControl()
    }
    
    func reloadData() {
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
    }

    
    func showError(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    private func setupRefreshControl() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshData(_ sender: Any) {
        // Call your data loading method here
        self.presenter?.fetchUniversities()
    }
}


extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeue(cell: UniversityTableViewCell.self) as? UniversityTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = presenter?.universitiesList[indexPath.row].name
        cell.stateLabel.text = presenter?.universitiesList[indexPath.row].country
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.moveToDetails(from: indexPath.row)
    }
}
