//
//  getImagePicker.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 31/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit

extension ViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageName = "IMG_\(Gallery.count)"

        imageFromCamera = image
        let imageToAdd = ImgData(name: imageName, source: imageFromCamera)
        Gallery.append(imageToAdd)
        galleryCollection.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
