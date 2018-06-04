//
//  File.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 15/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit

extension ViewController {
    @IBAction func backToGallery(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imageDetailsSegue" {
            let cell = sender as! CollectionViewCell
            let destination = segue.destination as! DetailsViewController
            
            destination.imageDetails = (cell.cellImage.image!, cell.cellName.text!)
        }
    }
}
