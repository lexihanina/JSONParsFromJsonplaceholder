//
//  CommentToPostTableViewController.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import UIKit

class CommentToPostTableViewController: UITableViewController {
    private let cellID = "CommentsTableViewCell"
    var dataToPass: [Comments]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CommentsTableViewCell else {
            return CommentsTableViewCell()
        }
        
        cell.fillCellWith(name: dataToPass?[indexPath.row].name ?? "No name",
                           email: dataToPass?[indexPath.row].email ?? "No email",
                           andBody: dataToPass?[indexPath.row].body ?? "No data")
        
        return cell       
    }
}
