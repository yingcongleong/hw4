//
//  Pie.swift
//  crud
//
//  Created by User07 on 2020/11/24.
//

import Foundation
import SwiftUI


struct Pie: View{
    
    @ObservedObject var moneyData = MoneyData()
    var breakfast_sum : Int = 0
    var lunch_sum : Int = 0
    var dinner_sum : Int = 0
    var drink_sum : Int = 0
    var tt_sum : Int = 0
    @State private var selectedIndex = 0
    var bf_avg : Double
    var l_avg : Double
    var dr_avg : Double
    var dk_avg : Double
    
    init(moneyData: MoneyData) {
        for index in moneyData.moneys{
            if(index.eatTimeIndex == 0){
                breakfast_sum = index.spent + breakfast_sum
            }
            else if(index.eatTimeIndex == 1){
                lunch_sum = index.spent + lunch_sum
            }
            else if(index.eatTimeIndex == 2){
                dinner_sum += index.spent
            }
            else{
                drink_sum = index.spent + drink_sum
            }
            tt_sum += index.spent
        }
        bf_avg = Double(breakfast_sum) / Double(tt_sum)*100
        l_avg = Double(lunch_sum) / Double(tt_sum )*100
        dr_avg = Double(dinner_sum) / Double(tt_sum )*100
        dk_avg = Double(drink_sum) / Double(tt_sum )*100
    }
    
    var body: some View{
            VStack{
                Picker(selection: $selectedIndex, label: Text("選擇圖表")) {
                    Text("Pie Chart").tag(0)
                    Text("Bar Chart").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                if(selectedIndex == 0){
                    PieChartView(percentages: [bf_avg,l_avg,dr_avg,dk_avg]).frame(width: 200, height: 200)
                    Text("Total Spent : \(tt_sum)")
                    HStack{
                        VStack{
                            Circle().fill(Color.blue).frame(width: 25, height: 25)
                            Text("早餐")
                        }
                        VStack{
                            Circle().fill(Color.red).frame(width: 25, height: 25)
                            Text("午餐")
                        }
                        VStack{
                            Circle().fill(Color.green).frame(width: 25, height: 25)
                            Text("晚餐")
                        }
                        VStack{
                            Circle().fill(Color.yellow).frame(width: 25, height: 25)
                            Text("飲料")
                        }
                    }
                }
                else{
                    BarChartView(typeWidths: [breakfast_sum,lunch_sum,dinner_sum,drink_sum])
                    VStack {
                        HStack{
                            VStack{
                                Rectangle().fill(Color.blue).frame(width: 25, height: 25)
                                Text("早餐")
                            }
                            VStack{
                                Rectangle().fill(Color.red).frame(width: 25, height: 25)
                                Text("午餐")
                            }
                            VStack{
                                Rectangle().fill(Color.green).frame(width: 25, height: 25)
                                Text("晚餐")
                            }
                            VStack{
                                Rectangle().fill(Color.yellow).frame(width: 25, height: 25)
                                Text("飲料")
                            }
                        }
                        Text("Total Spent : \(tt_sum)")
                    }
                    
                }
                
            }
        
    }
}

struct PieView_Previews: PreviewProvider {
    static var previews: some View {
        Pie(moneyData: MoneyData())
    }
}
