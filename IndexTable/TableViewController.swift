//
//  TableViewController.swift
//  IndexTable
//
//  Created by kevin chen on 2019/12/15.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dictData:NSDictionary!
    var listGroupname:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = Bundle.main.path(forResource: "team_dictionary", ofType: "plist")
        
        dictData = NSDictionary(contentsOfFile: plistPath!)
        
        let tempList = dictData.allKeys as! [String]
        listGroupname = tempList.sorted(by: <) as! NSArray

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return listGroupname.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var groupName = listGroupname[section] as! String
        
        var listTeams = dictData[groupName] as! NSArray
        
        return listTeams.count
    }
    


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let section = (indexPath as NSIndexPath).section
        
        let row = (indexPath as NSIndexPath).row
        
        let groupName = listGroupname[section] as! String
        
        let listTeams = dictData[groupName] as! NSArray
        
        cell.textLabel?.text = listTeams[row] as? String
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupName = listGroupname[section] as! String
        
        return groupName
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        for item in listGroupname{
            let title = (item as AnyObject).substring(to: 1) as String
            listTitles.append(title)
        }
        
        return listTitles
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
