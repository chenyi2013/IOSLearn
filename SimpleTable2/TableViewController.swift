//
//  TableViewController.swift
//  SimpleTable2
//
//  Created by kevin chen on 2019/12/14.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchResultsUpdating ,UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        filterContentForSearchText(searchString! as NSString, scope: searchController.searchBar.selectedScopeButtonIndex)
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        updateSearchResults(for: searchController)
    }
    
    
     var listTeams: NSArray!
    var listFilterTeams:NSArray!
    var searchController:UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        listTeams = NSArray(contentsOfFile: plistPath!)
        
        filterContentForSearchText("", scope: -1)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.scopeButtonTitles = ["中文","英文"]
        searchController.searchBar.delegate  = self
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.sizeToFit()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func filterContentForSearchText(_ searchText: NSString, scope:Int)  {
        if(searchText.length == 0){
            self.listFilterTeams = NSMutableArray(array: listTeams)
            return
        }
        
        var tempArray:NSArray!
        if(scope == 0){
            let scopePredicate = NSPredicate(format: "SELF.name contains[c]%@", searchText)
            tempArray = listTeams.filtered(using: scopePredicate) as! NSArray
            listFilterTeams = NSMutableArray(array: tempArray)
        }else if(scope == 1){
            let scopePredicate = NSPredicate(format: "SELF.image contains[c]%@", searchText)
            tempArray = listTeams.filtered(using: scopePredicate) as! NSArray
            listFilterTeams = NSMutableArray(array: tempArray)
        }else{
             listFilterTeams = NSMutableArray(array: listTeams)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listFilterTeams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier",for: indexPath) as! TableViewCell
        
        let row = (indexPath as NSIndexPath).row
        let rowDict = listFilterTeams[row] as! NSDictionary
        
         cell.label.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String )
        
        cell.icon.image = UIImage(named: imagePath)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
