//
//  MyTableViewController.swift
//  TestTab
//
//  Created by Arjen Hiemstra on 29.11.18.
//  Copyright © 2018 Omni Notitia. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchResultsUpdating {
    var data = ["One", "Two", "Three"]
    var searchController: UISearchController!

    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: nil) // nil same view to display results
        searchController.searchResultsUpdater = self // I am getting the events
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        self.definesPresentationContext = true // Otherwise issue screen black when coming back from other tab like settings.
        searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "For placeholder in search field") + "..."
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.autocorrectionType = .no
        searchController.searchBar.showsCancelButton = false
        navigationItem.searchController = searchController // Attach the controller to the navigation bar (iOS 11 only)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        print(#function)
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = data[indexPath.row]

        return cell
    }

    func updateSearchResults(for searchController: UISearchController) {
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    @IBAction func unwindToMyTableViewController(_ unwindSegue: UIStoryboardSegue) {
        print(#function)
        // Use data from the view controller which initiated the unwind segue
    }
}
