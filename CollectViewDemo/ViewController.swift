//
//  ViewController.swift
//  CollectViewDemo
//
//  Created by kevin chen on 2019/12/13.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class CollectViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return pickerProvincesData.count
        }else{
            return pickerCitiesData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return self.pickerProvincesData[row] as? String
        }else{
            return self.pickerCitiesData[row] as? String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            let seletedProvince = self.pickerProvincesData[row] as! String
            pickerCitiesData = pickerData[seletedProvince] as! NSArray
            pickerView.reloadComponent(1)
        }
    }
    

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewLabel: UILabel!
    
    var pickerData:NSDictionary!
    var pickerProvincesData:NSArray!
    var pickerCitiesData:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plistPath!)
        
        pickerData = dict
        
        self.pickerProvincesData = pickerData.allKeys as NSArray
        
        let seletedProvince = self.pickerProvincesData[0]
        
        pickerCitiesData = pickerData[seletedProvince] as! NSArray
    }

    @IBAction func onClick(_ sender: Any) {
        let theDate:NSDate = datePicker.date as! NSDate
        _ = theDate.description(with: Locale.current)
        
        let dateFormatter:DateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        label.text = dateFormatter.string(for: theDate)
        
        
    }
    
    @IBAction func onClickShowPickerView(_ sender: Any) {
        let row1 = self.pickerView.selectedRow(inComponent: 0)
        let row2 = self.pickerView.selectedRow(inComponent: 1)
        
        let selected1 = pickerProvincesData[row1] as! String
        let selected2 = pickerCitiesData[row2] as! String
        
        let title = String(format: "%@,%@市", selected1,selected2)
        
        self.pickerViewLabel.text = title
    }
}

