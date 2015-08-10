//
//  PreviewController.swift
//  instashot
//
//  Created by Anatoly Kudinov on 09/08/15.
//  Copyright © 2015 Anatoly Kudinov. All rights reserved.
//

import UIKit
import Photos

class PreviewController: UICollectionViewController {
    
    private var selectedImages: [UIImage] = []
    
    private var selectedAssets: [PHAsset] = []
    
    // Inderection because we need a place to fetch UIImages from assets
    func setAssets(assets: [PHAsset]) {
        selectedAssets = assets
        let options = PHImageRequestOptions()
        options.synchronous = true
        
        let manager = PHImageManager.defaultManager()
        for asset in selectedAssets {
            manager.requestImageForAsset(asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: PHImageContentMode.Default, options: options, resultHandler: {
                (image: UIImage?, _: [NSObject : AnyObject]?) in
                    self.selectedImages.append(image!)
                })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedAssets.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("previewCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blackColor()
        let image: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        image.image = selectedImages[indexPath.row]
        return cell
    }
}

