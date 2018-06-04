//
//  ChartAttributeStruct.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 22/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit
import Charts

struct ChartAttribute {
    static let colors = [
        UIColor(named: "greyish"),
        UIColor(named: "reddish"),
        UIColor(named: "blueish"),
        UIColor(named: "greenish"),
        UIColor(named: "pinkish"),
        ] as! [NSUIColor]
    
    static let xAnimation = 1.1
    static let yAnimation = 1.1
    static let minValue = 0.01
    static let unit = 100.0
}
