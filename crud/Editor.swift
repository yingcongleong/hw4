//
//  Editor.swift
//  crud
//
//  Created by User07 on 2020/11/23.
//

import Foundation
import SwiftUI

struct Editor:View{
    @Environment(\.presentationMode) var presentationMode
    var moneyData: MoneyData
    @State private var eatTimeIndex = 0
    @State private var name = ""
    @State private var spent = 0
    @State private var date = Date()
    var eatTime = ["早餐", "午餐", "晚餐", "飲料"]
    var editIndex: Int?
    var editMoney: Money?
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    
    var body: some View{
            Form{
                TextField("name",text : $name)
                Picker("哪一餐", selection: $eatTimeIndex) {
                    ForEach(0..<eatTime.count){ (index) in
                        Text(self.eatTime[index])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                TextField("spent \(spent)",value : $spent, formatter: NumberFormatter())
                DatePicker("Date",selection: $date)
                Text(dateFormatter.string(from: date))
            }
            .onAppear(perform: {
                if let editIndex = editIndex{
                    let editMoney = moneyData.moneys[editIndex]
                    name = editMoney.name
                    spent = editMoney.spent
                }
            })
            .navigationBarTitle(editIndex == nil ? "Add new spent" : "Edit new spent")
            
            .navigationBarItems(trailing: Button("Save"){
                let money = Money(spent: self.spent, name: self.name,eatTimeIndex: eatTimeIndex  , date: self.date)
                self.presentationMode.wrappedValue.dismiss()
                
                if let editMoney = self.editMoney {
                    let index = self.moneyData.moneys.firstIndex{
                        $0.id == editMoney.id
                    }!
                    self.moneyData.moneys[index] = money
                    self.presentationMode.wrappedValue.dismiss()
                }
                else{
                    self.moneyData.moneys.insert(money, at: 0)
                    self.presentationMode.wrappedValue.dismiss()
                }
                self.presentationMode.wrappedValue.dismiss()
            }).onAppear {
                if let editMoney = self.editMoney    {
                    self.name = editMoney.name
                    self.spent = editMoney.spent
                    self.eatTimeIndex = editMoney.eatTimeIndex
                    self.date = editMoney.date  
                }
            }
        
    }
}

struct EditorPreview:PreviewProvider{
    static var previews: some View{
        Editor(moneyData: MoneyData())
    }
}
