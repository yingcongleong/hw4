//
//  ContentView.swift
//  crud
//
//  Created by User07 on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var moneyData = MoneyData()
    
    var body: some View {
        TabView{
            MoneyList(moneyData: self.moneyData).tabItem {
                Image(systemName: "list.dash")
                Text("List")

            }
            Pie(moneyData: self.moneyData).tabItem {
                Image(systemName: "chart.pie.fill")
                Text("Chart")
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
