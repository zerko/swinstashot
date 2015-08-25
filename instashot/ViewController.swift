//
//  ViewController.swift
//  instashot
//
//  Created by Anatoly Kudinov on 08/08/15.
//  Copyright © 2015 Anatoly Kudinov. All rights reserved.
//

import UIKit
import Photos
import QBImagePickerController

class ViewController: UIViewController, QBImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "showScreenshotPicker")
  
        showScreenshotPicker()
    }
    
    override func viewDidAppear(animated: Bool) {
//        showScreenshotPicker()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showScreenshotPicker() {
        let qbPicker = QBImagePickerController()
        qbPicker.delegate = self
        qbPicker.allowsMultipleSelection = true
        qbPicker.showsNumberOfSelectedAssets = true
        
        presentViewController(qbPicker, animated: true, completion: nil)
    }
    
    func qb_imagePickerController(imagePickerController: QBImagePickerController!, didFinishPickingAssets assets: [AnyObject]!) {
//        let selectedAssets = assets as! [PHAsset]
//        let pc = self.storyboard!.instantiateViewControllerWithIdentifier("preview") as! PreviewController
        
        
        let vc = PreviewPickerViewController(nibName: "PreviewPickerViewController", bundle: nil);
        
        
//        pc.setAssets(selectedAssets)
        dismissViewControllerAnimated(true, completion: {
            () -> () in
            self.navigationController!.pushViewController(vc, animated: true);
        })
        
    }


}

