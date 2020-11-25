//
//  barchartView.swift
//  crud
//
//  Created by User07 on 2020/11/24.
//

import Foundation
import SwiftUI

struct BarChartView: View{
    var typeWidths: [Int]
    var body: some View{
        ScrollView(.horizontal){
            VStack(alignment: .leading){
                Group{
                    BarChart(finalWidth: typeWidths[0], red: 0, green: 0, blue: 1).padding(EdgeInsets(top: 40, leading: 0.5, bottom: 0, trailing: 0))
                    BarChart(finalWidth: typeWidths[1], red: 1, green: 0, blue: 0).padding(EdgeInsets(top: 40, leading: 0.5, bottom: 00, trailing: 0))
                    BarChart(finalWidth: typeWidths[2], red: 0, green: 1, blue: 0).padding(EdgeInsets(top: 40, leading: 0.5, bottom: 0, trailing: 0))
                    BarChart(finalWidth: typeWidths[3], red: 1, green: 1, blue: 0).padding(EdgeInsets(top: 40, leading: 0.5, bottom: 0, trailing: 0))
                    HStack{
                        Group{
                            ForEach(0..<20){(index) in
                                Text("\(index*25)")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(typeWidths: [100, 100, 100, 200])
    }
}
