//
//  ViewController.swift
//  DeleteAddCell
//
//  Created by kevin chen on 2019/12/15.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class ViewController: UITableViewController ,UITextFieldDelegate{

    @IBOutlet var txtField: UITextField!
    var listTeams:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.title = "单元格插入和删除"
        
        txtField.isHidden = true
        txtField.delegate = self
        
        listTeams = NSMutableArray(array:["黑龙江","吉林","辽宁"])
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: true)
        
        if(editing){
            txtField.isHidden = false
        }else{
            txtField.isHidden = true
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTeams.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "CellIdentifier"
        
        let b_addCell = ((indexPath as NSIndexPath ).row == listTeams.count)
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath)
        
        if(!b_addCell){
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = listTeams[(indexPath as NSIndexPath).row] as? String
        }else{
            txtField.frame = CGRect(x: 40, y: 0, width: 300, height: cell.frame.size.height)
            txtField.borderStyle = .none
            txtField.placeholder = "Add..."
            txtField.text = ""
            cell.addSubview(self.txtField)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if((indexPath as NSIndexPath).row == listTeams.count){
            return .insert
        }else{
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let indexPaths = [indexPath]
        
        if(editingStyle == .delete){
            
            listTeams.removeObject(at:(indexPath as NSIndexPath).row)
            tableView.deleteRows(at: indexPaths, with:.fade)
            
        }else if(editingStyle == .insert){
            listTeams.insert(txtField.text!, at: listTeams.count)
            tableView.insertRows(at: indexPaths,with: .fade)
        }
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if(indexPath.row == listTeams.count){
            return false
        }else{
            return true
        }
    }

}

