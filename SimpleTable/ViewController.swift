//
//  ViewController.swift
//  SimpleTable
//
//  Created by kevin chen on 2019/12/14.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return listTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier",for: indexPath)
        
        let row = (indexPath as NSIndexPath).row
        let rowDict = listTeams[row] as! NSDictionary
        
        cell.textLabel?.text = rowDict["name"] as? String
        
        let imagePath = String(format: "%@.png", rowDict["image"] as! String )
        cell.imageView?.image = UIImage(named: imagePath)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    var listTeams: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
        listTeams = NSArray(contentsOfFile: plistPath!)
    }


}

