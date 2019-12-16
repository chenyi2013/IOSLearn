//
//  ViewController.swift
//  MoveCell
//
//  Created by kevin chen on 2019/12/15.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var listTeams:NSMutableArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.title = "单元格移动"
        
        listTeams = NSMutableArray(array:["黑龙江","吉林","辽宁"])
        let rc = UIRefreshControl()
        rc.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl = rc
        rc.addTarget(self, action: #selector(refreshTableView), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func refreshTableView() {
        if(refreshControl?.isRefreshing == true){
            refreshControl?.attributedTitle = NSAttributedString(string: "加载中...")
            
            listTeams.add("dddd")
            
            refreshControl?.endRefreshing()
            refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新")
            tableView.reloadData()
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: true)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTeams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "CellIdentifier"
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = listTeams[(indexPath as NSIndexPath).row] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let stringToMove = listTeams[(sourceIndexPath as NSIndexPath).row]
        listTeams.removeObject(at: (sourceIndexPath as NSIndexPath).row)
        listTeams.insert(stringToMove, at: (destinationIndexPath as NSIndexPath).row)
    }

}

