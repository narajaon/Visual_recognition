//
//  CollectionViewCell.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 14/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    
    func displayCell(image: UIImage, name: String) {
        cellImage.image = image
        cellName.text = name
    }
    
//  Create a thread for each image to download
    func getImgFromURL(imgUrl: String, imgName: String) {
        let source = URL(string: imgUrl)!
        
        self.imageActivityIndicator.startAnimating()

        DispatchQueue.global(qos: .userInitiated).async {
            if let imgData = NSData(contentsOf: source) {
                
                DispatchQueue.main.async {
                    let img = UIImage(data: imgData as Data)
                    self.displayCell(image: img!, name: imgName)
                    self.imageActivityIndicator.stopAnimating()
                }
            }
        }
    }
}
