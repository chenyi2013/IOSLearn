//
//  ViewController.swift
//  ViewDemo
//
//  Created by kevin chen on 2019/12/12.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate,UITextViewDelegate{

    @IBOutlet weak var navationLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var toolbarLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clickUpload(_ sender: Any) {
        
        if(activityIndicatorView.isAnimating){
            activityIndicatorView.stopAnimating()
        }else{
            activityIndicatorView.startAnimating()
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        navationLabel.text = "save"
    }
    
    @IBAction func add(_ sender: Any) {
        navationLabel.text = "add"
    }
    
    @IBAction func save(_ sender: Any) {
        toolbarLabel.text = "save"
    }
    
    @IBAction func open(_ sender: Any) {
        toolbarLabel.text = "open"
    }
    
    @IBAction func clickDownload(_ sender: Any) {
        progressView.progress = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(download), userInfo: nil, repeats: true)
    }
    
    @objc func download() {
        progressView.progress = progressView.progress + 0.1
        if(progressView.progress == 1.0){
            timer.invalidate()
            
            let alertController:UIAlertController = UIAlertController(title: "download completed!", message: "", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func sliderValueChange(_ sender: Any) {
        let slider = sender as! UISlider
        
        let value = Int(slider.value)
        let newValue = String(format: "%d",value)
        valueLabel.text = newValue
        
    }
    @IBAction func switchValueChange(_ sender: Any) {
        let witchSwitch = sender as! UISwitch
        let setting = witchSwitch.isOn
        self.leftSwitch.setOn(setting, animated: true)
        self.rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func touchDown(_ sender: Any) {

        let isHidden = self.leftSwitch.isHidden
        leftSwitch.isHidden = !isHidden
        rightSwitch.isHidden = !isHidden
    }
    
    @IBAction func onClick(_ sender: Any) {
        self.label.text = "hello world"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField 获得焦点,点击return键")
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    
        if(text == "\n"){
            print("TextView获得焦点，点击return键")
            return false
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(_ notification:Notification){
        print("键盘打开")
    }
    
    @objc func keyboardDidHide(_ notification:Notification) {
        print("键盘关闭")
    }
    @IBAction func clickBtnDialog(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Alert", message: "Alert text goes here", preferredStyle: UIAlertController.Style.alert)
        
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            print("Tap No Button")
        }
    
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { (UIAlertAction) in
            print("Tap Yes Button")
        }
        
        
    
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
    
        
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func clickBtnSheet(_ sender: Any) {
        
        let alertController = UIAlertController()
        
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            print("Tap No Button")
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { (UIAlertAction) in
            print("Tap Yes Button")
        }
        
        let otherAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Other Button")
        }
        
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        alertController.addAction(otherAction)
        
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        
        present(alertController, animated: true, completion: nil)

    }
}

