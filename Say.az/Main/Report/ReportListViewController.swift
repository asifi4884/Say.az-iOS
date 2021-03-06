//
//  ReportListViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 2/20/21.
//

import UIKit

class ReportListViewController: CustomNavigationBarVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var titleView: TitleView! {
        didSet {
            titleView.list = ["receipt.option.coming.title".localize(),
                              "receipt.option.sent.title".localize()]
            titleView.filterAction = { index in
                //TODO: Do smth


                self.tableView.reloadData()
            }
        }
    }
    var list: [(sectionTitle: String, rows: [RecieptDetails])] = [("2020",
                                                                   [.init(name: "Jhon Nielson", voen: "324314123", amount: "200 AZN", date: "29.12.2020"), .init(name: "Bery Allen", voen: "324314123", amount: "400 AZN", date: "30.12.2020")]),
       ("2021", [
            .init(name: "Ashly West", voen: "32431433", amount: "1,200 AZN", date: "23.01.2021"),
            .init(name: "Kyle Barrack", voen: "4524123", amount: "800 AZN", date: "06.03.2021"),
            .init(name: "Tony Nest", voen: "984314123", amount: "320 AZN", date: "01.04.2020")])]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "income.cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "income.cell") as! CommonTableViewCell
        cell.name.text = list[indexPath.section].rows[indexPath.row].name
        cell.voen.text = list[indexPath.section].rows[indexPath.row].voen
        cell.amount.text = list[indexPath.section].rows[indexPath.row].amount
        cell.date.text = list[indexPath.section].rows[indexPath.row].date
        //cell.hasLeftActions = true
        return cell
    }


}
