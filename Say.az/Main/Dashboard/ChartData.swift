//
//  ChartData.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/8/21.
//

import Foundation

class ChartData {
    var months: [String]
    var values: [Int]

    var isExpanded = false

    init(months: [String], values: [Int]) {
        self.months = months
        self.values = values
    }

    func numOfRows(in section: Int) -> Int {
        return isExpanded ? 2 : 1
    }
}
