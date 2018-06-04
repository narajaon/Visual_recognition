//
//  imageDetails.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 14/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit
import Charts
import CoreML

class DetailsViewController: UIViewController, UIBarPositioningDelegate {
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var imageName: UINavigationItem!
    @IBOutlet weak var currChart: PieChartView!
    @IBOutlet weak var stackView: UIStackView!
    
    var imageDetails: (UIImage, String)!
    let model = LaptopReckon()
    
    func displayImageDetails(details: (UIImage, String)) {
        self.selectedImage.image = details.0
        self.imageName.title = details.1
    }
    
//    func position(for bar: UIBarPositioning) -> UIBarPosition {
//        return .topAttached
//    }
    
    override func viewDidLoad() {
        if let results = self.getMLResults(image: imageDetails.0, label: imageDetails.1, model: model) {
            self.displayImageDetails(details: imageDetails)
            self.displayChartData(results: results)
            stackView.sendSubview(toBack: selectedImage)
        }
    }

}
