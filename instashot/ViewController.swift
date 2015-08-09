//
//  ViewController.swift
//  instashot
//
//  Created by Anatoly Kudinov on 08/08/15.
//  Copyright © 2015 Anatoly Kudinov. All rights reserved.
//

import UIKit
import QBImagePickerController

class ViewController: UIViewController, QBImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "showScreenshotPicker")
    }
    
    override func viewDidAppear(animated: Bool) {
        showScreenshotPicker()
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
        let previewController = PreviewController()
        dismissViewControllerAnimated(true, completion: {
            () -> () in
            print("Navigating")
            self.navigationController!.pushViewController(previewController, animated: true)
        })
        
    }


}

