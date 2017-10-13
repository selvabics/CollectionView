//
//  ViewController.swift
//  CollectionView
//
//  Created by jayaraj on 12/12/16.
//  Copyright © 2016 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    var SCREEN_WIDTH : CGFloat?
    var SCREEN_HEIGHT : CGFloat?
    var SM_IPHONE_THUMB_CONTAINER_SIZE : CGFloat? = 54
    
    @IBOutlet weak var collectionView : UICollectionView?
    @IBOutlet weak var collectionView2 : UICollectionView?
    
    weak var imgView : UIImageView?
    weak var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SCREEN_WIDTH = self.view.frame.size.width
        SCREEN_HEIGHT = self.collectionView?.bounds.size.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        layout.itemSize = CGSize(width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView?.collectionViewLayout = layout
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.scrollView = scrollView
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.collectionView2 && self.scrollView == self.collectionView2{
//            collectionView?.contentOffset = (self.collectionView2?.contentOffset)!
//            let x : CGFloat = self.collectionView2!.contentOffset.x / self.collectionView2!.bounds.size.width * SCREEN_WIDTH!
//            let y : CGFloat = 0
//            let contentOffset = CGPoint(x: x, y: y)
//            self.collectionView?.contentOffset = contentOffset
        }else if scrollView == self.collectionView && self.scrollView == self.collectionView{
            let x : CGFloat = self.collectionView!.contentOffset.x / self.collectionView!.bounds.size.width * SM_IPHONE_THUMB_CONTAINER_SIZE!
            let y : CGFloat = 0
            let contentOffset = CGPoint(x: x, y: y)
            
            let center = self.view.convert((self.collectionView2?.center)!, to: self.collectionView2)
            
            if collectionView2!.indexPathForItem(at: center) != nil{
                let index = collectionView2!.indexPathForItem(at: center)
                let cell = collectionView2?.cellForItem(at: index!) as? CollectionViewCell
                var width : CGFloat = x / CGFloat(((index?.row)!+1))
                width = width + SM_IPHONE_THUMB_CONTAINER_SIZE!
                
                UIView.transition(with: collectionView2!, duration: 0.2, options: [], animations: {
//                    cell?.bounds = CGRect(x: 0, y: 0, width: width, height: (self.collectionView2?.bounds.size.height)!)
                    
                    }, completion: nil)
            }
            self.collectionView2?.contentOffset = contentOffset
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.collectionView2{
            return UIEdgeInsetsMake(0, ((self.collectionView2?.bounds.size.width)!/2) - (SM_IPHONE_THUMB_CONTAINER_SIZE!/2), 0, ((self.collectionView2?.bounds.size.width)!/2) - (SM_IPHONE_THUMB_CONTAINER_SIZE!/2))
        }
       return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView2{
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.collectionView2?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView2{
            return CGSize(width: 44, height: 68);
        }
        return CGSize(width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!);
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
//    func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        
//        var layoutAttributes = [UICollectionViewLayoutAttributes]()
////        if cache.isEmpty {
////            self.prepare()
////        }
////        for attributes in cache {
//            if attributes.frame.intersects(rect) {
//                layoutAttributes.append(self.layoutAttributesForItem(at: attributes.indexPath)!)
//            }
////        }
//        return layoutAttributes
//    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        SCREEN_WIDTH = self.view.frame.size.width
        SCREEN_HEIGHT = self.view.frame.size.height
        collectionView?.reloadData()
    }
    
}

