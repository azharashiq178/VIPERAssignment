//
//  ListingViewController.swift
//  TAMMVIPERAssignment
//
//  Created by Muhammad Azher on 07/05/2024.
//

import UIKit

class ListingViewController: UIViewController, ListingView {
    
    var presenter: ListingPresenterImp?
    
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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func reloadData() {
        self.tableView.reloadData()
    }

}


extension ListingViewController: UITableViewDataSource {
    
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
    
}
