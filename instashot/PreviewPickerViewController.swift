//
//  PreviewPickerViewController.swift
//  instashot
//
//  Created by Sy Bohy on 8/25/15.
//  Copyright © 2015 Anatoly Kudinov. All rights reserved.
//

import UIKit
import Photos

class PreviewPickerViewController: UICollectionViewController {
    @IBOutlet weak var templatePickerCollectionView: UICollectionView!
    @IBOutlet weak var previewImage: UIImageView!
    
    private var selectedImages: [UIImage] = []
    
    private var selectedAssets: [PHAsset] = []
    
    // Inderection because we need a place to fetch UIImages from assets
    func setAssets(assets: [PHAsset]) {
        selectedAssets = assets
        let options = PHImageRequestOptions()
        options.synchronous = true


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // as a first pass here, we need to get the first template and fit the screenshot inside of it. Once that's done, we can set the self.previewImage to that image
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedAssets.count
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("previewCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blackColor()
        let image: UIImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        image.image = selectedImages[indexPath.row]
        return cell
    }

}
