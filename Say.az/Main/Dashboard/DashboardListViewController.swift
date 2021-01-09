//
//  DashboardListViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/8/21.
//

import UIKit

class DashboardListViewController: CustomNavigationBarVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var titleView: TitleView! {
        didSet {
            titleView.list = ["dashboard.option.year.title".localize(),
                              "dashboard.option.month.title".localize()]
            titleView.filterAction = { index in
                //TODO: Do smth
                self.img = index == 0 ? #imageLiteral(resourceName: "dashboard.0"): #imageLiteral(resourceName: "dashboard.1")

                self.tableView.reloadData()
            }
        }
    }
    var img = #imageLiteral(resourceName: "dashboard.0")
    var list: [(sectionTitle: String, rows: [String])] = [("2020", ["sdfa", "sdgdsg", "sgdgasgd"]),
       ("2020", ["sdfa", "sdgdsg", "sgdgasgd"]),
    ("2020", ["sdfa", "sdgdsg", "sgdgasgd"]),
    ("2020", ["sdfa", "sdgdsg", "sgdgasgd"])]


    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "income.cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle("bank.accounts.title".localize())
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].rows.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].sectionTitle
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "line.chart.cell") as! LineChartCell
//        cell.setChart(values: [4000, 120, 105, 1253, 600, 2300, 4321, 4332, 3143, 1243])
        let cell = tableView.dequeueReusableCell(withIdentifier: "chart.cell.demo") as! ChartDemoCell

        cell.img.image = img
        return cell
    }


}

class ChartDemoCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
}

