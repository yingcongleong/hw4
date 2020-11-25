//
//  Money.swift
//  crud
//
//  Created by User07 on 2020/11/23.
//

import Foundation
import SwiftUI



struct Money: Identifiable, Codable {
    let id = UUID()
    var spent: Int
    var name: String
    var eatTimeIndex: Int
    var date: Date
}


