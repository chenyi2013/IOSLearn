//
//  EventCollectionViewCell.swift
//  CollectViewSample
//
//  Created by kevin chen on 2019/12/14.
//  Copyright © 2019 kevin chen. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        let cellWidth :CGFloat = frame.size.width
        let imageViewWidth:CGFloat = 101
        let imageViewHeight:CGFloat = 101
        let imageViewTopView:CGFloat = 15
        
        imageView = UIImageView(frame: CGRect(x: (cellWidth-imageViewWidth/2), y: imageViewTopView, width: imageViewWidth, height: imageViewHeight))
        
        addSubview(imageView)
        
        let labelWidth:CGFloat = 101
        let labelHeight:CGFloat = 16
        let labelTopView:CGFloat = 120
        
        label = UILabel(frame: CGRect(x: (cellWidth-labelWidth/2), y: labelTopView, width: labelWidth, height: labelHeight))
        
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
