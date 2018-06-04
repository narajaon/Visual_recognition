//
//  ViewController.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 14/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit

//  Main class, entry point of the app
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var galleryCollection: UICollectionView!
    
    @IBAction func cameraButton(_ sender: Any) {
        let permission = self.checkPermissions()
        self.setUpCamera(perm: permission, camHandler: setUpCaptureSession)
    }
    
    var imageFromCamera: UIImage!
    var selectedImage: (UIImage, String)!
    
}
