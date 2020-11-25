//
//  barchart.swift
//  crud
//
//  Created by User07 on 2020/11/24.
//

import Foundation
import SwiftUI

struct BarChart: View{
    @State private var width: CGFloat = 0
    var finalWidth: Int
    var red: Double
    var green: Double
    var blue: Double
    var body: some View{
        Rectangle()
            .fill(Color(red: red, green: green, blue: blue))
            .frame(width: width, height: 20)
            .animation(.linear(duration: 1))
            .onAppear{
                self.width = CGFloat(self.finalWidth/25)*20
        }
    }
}
struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(finalWidth: 100, red: 1, green: 0, blue: 0)
    }
}
