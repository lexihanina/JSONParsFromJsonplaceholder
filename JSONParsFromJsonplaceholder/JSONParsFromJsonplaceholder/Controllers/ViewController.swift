//
//  ViewController.swift
//  JSONParsFromJsonplaceholder
//
//  Created by Lexi Hanina on 26.01.24.
//

import UIKit

enum GetType {
    case posts
    case allComments
    case users
    case todos
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        Task {
            do {
                switch segue.identifier {
                    
                case "AllPostsTableViewController":
                    let posts = try await getDataFor(getType: .posts) as [Posts]?
                    
                    DispatchQueue.main.async {
                        if let posts = posts {
                            if let destinationVC = segue.destination as? AllPostsTableViewController {
                                destinationVC.dataToPass = posts
                                destinationVC.tableView.reloadData()
                            }
                        } else {
                            print("Invalid Data Type")
                        }
                    }
                    
                case "AllCommentsTableViewController":
                    let allComments = try await getDataFor(getType: .allComments) as [Comments]?
                    
                    DispatchQueue.main.async {
                        if let allComments = allComments {
                            if let destinationVC = segue.destination as? AllCommentsTableViewController {
                                destinationVC.dataToPass = allComments
                                destinationVC.tableView.reloadData()
                            }
                        } else {
                            print("Invalid Data Type")
                        }
                    }
                    
                case "AllUsersTableViewController":
                    let allUsers = try await getDataFor(getType: .users) as [Users]?
                    
                    DispatchQueue.main.async {
                        if let allUsers = allUsers {
                            if let destinationVC = segue.destination as? AllUsersTableViewController {
                                destinationVC.dataToPass = allUsers
                                destinationVC.tableView.reloadData()
                            }
                        } else {
                            print("Invalid Data Type")
                        }
                    }
                    
                case "TodosTableViewController":
                    let todos = try await getDataFor(getType: .todos) as [Todos]?
                    
                    DispatchQueue.main.async {
                        if let todos = todos {
                            if let destinationVC = segue.destination as? TodosTableViewController {
                                destinationVC.dataToPass = todos
                                destinationVC.tableView.reloadData()
                            }
                        } else {
                            print("Invalid Data Type")
                        }
                    }
                    
                default:
                    print("Transition went wrong")
                }
            } catch Errors.invalidURL {
                print("Invalid URL")
            } catch Errors.invalidResponse {
                print("Invalid Response")
            } catch Errors.invalidData {
                print("Invalid Data")
            } catch Errors.invalidType {
                print("Invalid Type")
            } catch {
                print("Unexpected error")
            }
        }
    }
    
    func getDataFor<T: DecodableData>(getType: GetType) async throws -> [T]? {
        var url: URL?
        
        switch getType {
        case .posts:
            url = URLBuilder().forPosts().build()
        case .allComments:
            url = URLBuilder().forAllComments().build()
        case .todos:
            url = URLBuilder().forTodos().build()
        case .users:
            url = URLBuilder().forUsers().build()
        }
        
        do {
            let data = try await NetworkManager.shared.makeGETRequest(withURL: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([T].self, from: data)
            return decodedData
        } catch {
            throw Errors.invalidData
        }
    }
}
