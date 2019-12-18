//
//  ViewController.swift
//  ModalViewSample
//
//  Created by kevin chen on 2019/12/17.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector:#selector(registerCompletion(notification:)) , name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc
    func registerCompletion(notification:Notification) {
        let theData:NSDictionary = notification.userInfo as! NSDictionary
        let username = theData["username"] as!String
        userNameTxt.text = username
        
    }

}

