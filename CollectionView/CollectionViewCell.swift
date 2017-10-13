//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by jayaraj on 13/12/16.
//  Copyright © 2016 sample. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView : UIImageView?
    @IBOutlet weak var scrollView: UIScrollView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        //You Code here
        scrollView?.minimumZoomScale = 1.0
        scrollView?.maximumZoomScale = 6.0
    }
    
    
}
