//
//  piechartview.swift
//  crud
//
//  Created by User07 on 2020/11/24.
//

import Foundation
import SwiftUI

struct PieChartView: View{
    var percentages : [Double]
    var angles : [Angle]
    
   
    init(percentages: [Double]) {
        self.percentages = percentages
        angles = [Angle]()
        var startDegree: Double = 0
        for percentage in percentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * percentage / 100
        }
    }

    var body: some View{
        ZStack {
            PieChart(startAngle: angles[0], endAngle: angles[1]).fill(Color.blue)
            PieChart(startAngle: angles[1], endAngle: angles[2]).fill(Color.red)
            PieChart(startAngle: angles[2], endAngle: angles[3]).fill(Color.green)
            PieChart(startAngle: angles[3], endAngle: angles[0]).fill(Color.yellow)
            
        }
    }
}


