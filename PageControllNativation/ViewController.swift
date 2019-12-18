//
//  ViewController.swift
//  PageControllNativation
//
//  Created by kevin chen on 2019/12/18.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

let S_WIDTH:CGFloat = UIScreen.main.bounds.size.width
let S_HEIGHT:CGFloat = UIScreen.main.bounds.size.height

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imageView1:UIImageView!
    var imageView2:UIImageView!
    var imageView3:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollview.delegate = self
        
        scrollview.contentSize = CGSize(width: S_WIDTH*3, height: S_HEIGHT)
        scrollview.frame = view.frame
        
        imageView1 = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: S_WIDTH, height: S_HEIGHT))
        imageView1.image = UIImage(named: "保罗克利-肖像.png")
        
        imageView2 = UIImageView(frame: CGRect(x: S_WIDTH, y: 0.0, width: S_WIDTH, height: S_HEIGHT))
        imageView2.image = UIImage(named: "罗丹-思想者.png")
        
        imageView3 = UIImageView(frame: CGRect(x: S_WIDTH*2, y: 0.0, width: S_WIDTH, height: S_HEIGHT))
        imageView3.image = UIImage(named: "达芬奇-蒙娜丽莎.png")
        
        scrollview.addSubview(imageView2)
        scrollview.addSubview(imageView3)
        scrollview.addSubview(imageView1)
        
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollview.contentOffset
        pageControl.currentPage = Int(offset.x/S_WIDTH)
    }

    @IBAction func viewChange(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            let whichPage = self.pageControl.currentPage
            self.scrollview.contentOffset = CGPoint( x:S_WIDTH*CGFloat.init(whichPage),y:0.0)
        }
    }
    
}

