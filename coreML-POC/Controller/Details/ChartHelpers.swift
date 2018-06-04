//
//  ChartHelpers.swift
//  coreML-POC
//
//  Created by RAJAONARISON on 16/05/2018.
//  Copyright © 2018 narajaon. All rights reserved.
//

import UIKit
import Charts

extension DetailsViewController {
    func displayChartData(results: [String : Double]) {
        let chartDataEntry = fillDataEntry(dataToAdd: results)
        let chartDataSet = PieChartDataSet(values: chartDataEntry, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        let colors = ChartAttribute.colors
        
        chartDataSet.colors = colors
        currChart.data = chartData
        currChart.chartDescription?.text = ""
        currChart.animate(xAxisDuration: ChartAttribute.xAnimation)
        currChart.animate(yAxisDuration: ChartAttribute.yAnimation)
    }
    
    func fillRemainingStats(stats: [String : Double]) -> Double {
        var totalScore = 0.0
        
        for elem in stats {
            totalScore += elem.value
        }
        
        if totalScore < 1 {
            return 1 - totalScore
        }
        
        return 0
    }
    
    func fillDataEntry(dataToAdd: [String : Double]) -> [PieChartDataEntry]{
        var data = [PieChartDataEntry]()
        
        for (key, val) in dataToAdd {
            let dataEntry = PieChartDataEntry(value: val * 100, label: key)
            if (val > ChartAttribute.minValue) {
                data.append(dataEntry)
            }
        }
        
        return data
    }

}
