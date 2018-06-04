//
//  CameraVC.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 29/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setUpCaptureSession() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
}
