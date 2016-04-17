//
//  VideoCaptureViewController.swift
//  SeeMeTrain
//
//  Created by donnelly, joseph andrew on 4/17/16.
//  Copyright (c) 2016 Sapphire. All rights reserved.
//

import UIKit
import MobileCoreServices

class VideoCaptureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func record(sender: AnyObject) {
        startCameraFromViewController(self, withDelegate: self)
    }
    
    func startCameraFromViewController(viewController: UIViewController, withDelegate delegate: protocol<UIImagePickerControllerDelegate, UINavigationControllerDelegate>) -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) == false {
            return false
        }
        
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .Camera
        cameraController.mediaTypes = [kUTTypeMovie as NSString as String]
        cameraController.allowsEditing = false
        cameraController.delegate = delegate
        
        presentViewController(cameraController, animated: true, completion: nil)
        return true
    }
    
    func video(videoPath: NSString, didFinishSavingWithError error: NSError?, contextInfo info: AnyObject) {
        var title = "Success"
        var message = "Video was saved"
        if let _ = error {
            title = "Error"
            message = "Video failed to save"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
}

extension VideoCaptureViewController: UIImagePickerControllerDelegate {

}

// MARK: - UINavigationControllerDelegate

extension VideoCaptureViewController: UINavigationControllerDelegate {
}