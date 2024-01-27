//
//  AllUsersTableViewController.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import UIKit

class AllUsersTableViewController: UITableViewController {
    private let cellID = "AllUsersTableViewCell"
    var dataToPass: [Users]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataToPass = dataToPass?.count {
            return dataToPass
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? AllUsersTableViewCell else {
        return AllPostsTableViewCell()
        }
        
        cell.fillCellWith(name: dataToPass?[indexPath.row].name ?? "No name",
                           username: dataToPass?[indexPath.row].username ?? "No username",
                           email: dataToPass?[indexPath.row].email ?? "No email",
                           userID: dataToPass?[indexPath.row].id ?? 0,
                           street: dataToPass?[indexPath.row].address.street ?? "No street",
                           suite: dataToPass?[indexPath.row].address.suite ?? "No suite",
                           city: dataToPass?[indexPath.row].address.city ?? "No city",
                           zipcode: dataToPass?[indexPath.row].address.zipcode ?? "No zipcode",
                           lat: dataToPass?[indexPath.row].address.geo.lat ?? "No lat",
                           lng: dataToPass?[indexPath.row].address.geo.lng ?? "No lng",
                           phone: dataToPass?[indexPath.row].phone ?? "No phone",
                           website: dataToPass?[indexPath.row].website ?? "No website",
                           company: dataToPass?[indexPath.row].company.name ?? "No company",
                           catchPhrase: dataToPass?[indexPath.row].company.catchPhrase ?? "No catch phrase",
                           bs: dataToPass?[indexPath.row].company.bs ?? "No bs")
        
        return cell
    }
}
