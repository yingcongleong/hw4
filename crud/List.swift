//
//  List.swift
//  crud
//
//  Created by User07 on 2020/11/23.
//

import Foundation
import SwiftUI

struct MoneyList : View{
    @ObservedObject var moneyData = MoneyData()
    @State private var showEditor = false
    @State private var showPieChart = false
    @State private var showChart = false
    @State private var date = Date()
    var body: some View{
        VStack{
            NavigationView{
                List{
                    ForEach(moneyData.moneys.indices,id: \.self){(index) in
                        NavigationLink(
                            destination: Editor(moneyData: moneyData,editIndex:index)) {
                            MoneyRow(money: moneyData.moneys[index])
                            }
                        
                    }
                    .onDelete {(IndexSet) in
                        moneyData.moneys.remove(atOffsets: IndexSet)
                    }
                }
                .navigationTitle("Money")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            showEditor = true
                            
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                        .sheet(isPresented: $showEditor){
                            NavigationView{
                                Editor(moneyData:moneyData)
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()
                    }
                })
                
            }
        }
        
    }
}


struct MoneyListPreview: PreviewProvider{
    
    static var previews: some View{
        NavigationView{
            MoneyList()
        }
    }
}
