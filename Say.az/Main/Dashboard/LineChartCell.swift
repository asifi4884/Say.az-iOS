//
//  LineChartCell.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/8/21.
//

import UIKit
import Charts
class LineChartCell: UITableViewCell {

    @IBOutlet fileprivate weak var lineChartView: LineChartView!

    var months = ["1","2","3","4","5","6","7","8","9","10","11","13"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


       func setChart(values: [Double]) {

           var dataEntries: [ChartDataEntry] = []

           for i in 0..<values.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
               dataEntries.append(dataEntry)
           }







           let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
           let lineChartData = LineChartData(dataSet: lineChartDataSet)
           lineChartView.data = lineChartData
        lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)

       }

   }
