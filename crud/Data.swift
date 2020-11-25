//
//  Data.swift
//  crud
//
//  Created by User07 on 2020/11/23.
//

import Foundation
import SwiftUI
//meals = moneys
//Food = Money
class MoneyData: ObservableObject{
    @Published var moneys = [Money](){
            didSet {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(moneys) {
                    UserDefaults.standard.set(data, forKey: "moneys")
                }
            }
        }
        
        init() {
            if let data = UserDefaults.standard.data(forKey: "moneys") {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([Money].self, from: data) {
                    moneys = decodedData
                }
            }
        }
}
