//
//  AllPostsTableView.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 27.01.24.
//

import UIKit

class AllPostsTableViewController: UITableViewController {
    private let cellID = "AllPostsTableViewCell"
    var dataToPass: [Posts]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? AllPostsTableViewCell else {
            return AllPostsTableViewCell()
        }
        
        cell.fillCellWith(title: dataToPass?[indexPath.row].title ?? "No title",
                           andBody: dataToPass?[indexPath.row].body ?? "No data")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Task {
            let commentsForPost = try await getCommentForPostAt(index: indexPath.row)
            let commentsController = self.storyboard?.instantiateViewController(withIdentifier: "CommentToPostTableViewController") as? CommentToPostTableViewController
            
            DispatchQueue.main.async {
                if let commentsForPost = commentsForPost {
                    if let commentsController = commentsController {
                        commentsController.dataToPass = commentsForPost
                        self.navigationController?.pushViewController(commentsController, animated: true)
                    }
                }
            }
        }
    }
    
    func getCommentForPostAt(index: Int) async throws -> [Comments]? {
        do {
            let url = URLBuilder().forPosts().andCommentsToPost(number: index + 1).build()
            
            let data = try await NetworkManager.shared.makeGETRequest(withURL: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([Comments].self, from: data)
            return decodedData
        } catch {
            throw Errors.invalidData
        }
    }
}
