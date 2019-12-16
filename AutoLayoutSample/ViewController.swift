//
//  ViewController.swift
//  AutoLayoutSample
//
//  Created by kevin chen on 2019/12/15.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick(_ sender: Any) {
        label.text = "dfdkfjkdsjfkdjfkjdkfjdkfjkdjfkdjfkdfdkfjkdsjfkdjfkjdkfjdkfjkdjfkdjfk"
    }
}

