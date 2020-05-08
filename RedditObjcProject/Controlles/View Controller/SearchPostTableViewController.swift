//
//  SearchPostTableViewController.swift
//  RedditObjcProject
//
//  Created by Junior Suarez-Leyva on 5/7/20.
//  Copyright © 2020 Junior Suarez-Leyva. All rights reserved.
//

import UIKit

class SearchPostTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts: [DVMPost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        DVMPostController.shared().searchForPost(withSearchTerm: searchTerm) { (posts, error) in
            self.posts = posts
            DispatchQueue.main.async {
                self.searchBar.text = ""
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = posts[indexPath.row]
        cell.post = post
        
        DVMPostController.shared().fetchImagePost(post) { (image) in
            DispatchQueue.main.async {
                cell.thumbnail = image
            }
        }
        
        return cell
    }
    
}
