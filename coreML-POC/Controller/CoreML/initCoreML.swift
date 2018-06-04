//
//  initCoreML.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 24/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import CoreML
import UIKit

extension DetailsViewController {
    func getMLResults(image: UIImage, label: String, model: LaptopReckon) -> [String : Double]? {
        let formatedImage = image.formatSize(size: 224)
        let bufferedImage = formatedImage.toBuffer()
        
        guard let prediction = try? model.prediction(data: bufferedImage!) else {
            print("Error: Something went wrong")
            return nil
        }
        
        let otherStat = fillRemainingStats(stats: prediction.outputScores)
        var scores = prediction.outputScores
        scores.updateValue(otherStat, forKey: "Other")
        
        return scores
    }
}
