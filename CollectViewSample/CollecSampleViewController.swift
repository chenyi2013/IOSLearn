//
//  ViewController.swift
//  CollectViewSample
//
//  Created by kevin chen on 2019/12/14.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class CollecSampleViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var events:NSArray!
    var collectionView:UICollectionView!
    let COL_NUM = 2
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let num = events.count%COL_NUM
        
        if(num == 0){
            return events.count/COL_NUM
        }else{
            return events.count/COL_NUM + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return COL_NUM
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! EventCollectionViewCell
        let idx = indexPath.section*COL_NUM + indexPath.row
        
        print("idx",idx)
        print("event.counts",events.count)
        
        if(events.count<=idx){
            return cell
        }
        
        let event = self.events[idx] as! NSDictionary
        cell.label.text = event["name"] as? String
        cell.imageView.image = UIImage(named: event["image"] as! String)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = self.events[(indexPath as NSIndexPath).section*COL_NUM+(indexPath as NSIndexPath).row] as! NSDictionary
        print("select event name:",event["name"])
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let plistPath = Bundle.main.path(forResource: "events", ofType: "plist")
        events = NSArray(contentsOfFile: plistPath!)
        setupCollectonView()
    }
    
    func setupCollectonView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80,height: 80 )
        layout.sectionInset = UIEdgeInsets.init(top: 15, left: 15, bottom: 30, right: 15)
        let screenSize = UIScreen.main.bounds.size
        
        if(screenSize.height>568){
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.sectionInset = UIEdgeInsets.init(top: 15, left: 15, bottom: 20, right: 15)
        }
        
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
    }


}

