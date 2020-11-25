//
//  Row.swift
//  crud
//
//  Created by User07 on 2020/11/23.
//

import Foundation
import SwiftUI

struct MoneyRow : View{
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
        }()
    var eatTime = ["早餐", "午餐", "晚餐", "飲料"]
    var money: Money
    var body: some View{
        HStack{
            Text(money.name)
            Text("\(money.spent)")
            Text(dateFormatter.string(from: money.date))
            Text(eatTime[money.eatTimeIndex])
        }
    }
}

