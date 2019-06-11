//
//  EntriesTableViewController.swift
//  journal-coredata
//
//  Created by John Pitts on 6/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryController.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)

        guard let entryCell = cell as? EntryTableViewCell else { return cell }
        
        let entry = entryController.entries[indexPath.row]
        entryCell.entry = entry   // sets TableViewCell's entry property to entry at indexPath

        return entryCell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
            // get entry from array and send to delete method in modelController, then reload with the data minus the deleted entry (redundant with deleteRows?
            let entry = entryController.entries[indexPath.row]
            entryController.deleteEntry(entry: entry)
            //tableView.reloadData()  // isnt this redundant?
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "CellDetailSegue" {
            let detailVC = segue.destination as! EntryDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.entry = entryController.entries[indexPath.row]
                detailVC.entryController = entryController
            }
        }
        if segue.identifier == "AddEntrySegue" {
            let detailVC = segue.destination as! EntryDetailViewController
            detailVC.entryController = entryController
        }
    }
    
    let entryController = EntryController()

}
