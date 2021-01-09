//
//  IncomeListViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/26/20.
//

import UIKit

class IncomeListViewController: CustomNavigationBarVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var titleView: TitleView! {
        didSet {
            titleView.list = ["income.option.year.title".localize(),
                              "income.option.month.title".localize()]
            titleView.filterAction = { index in
                //TODO: Do smth
                self.tableView.reloadData()
            }
        }
    }
    var list: [(sectionTitle: String, rows: [String])] = [("2020", ["sdfa", "sdgdsg", "sgdgasgd"]),
       ("2020", ["sdfa", "sdgdsg", "sgdgasgd"]),
    ("2020", ["sdfa", "sdgdsg", "sgdgasgd"]),
    ("2020", ["sdfa", "sdgdsg", "sgdgasgd"])]


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
        return cell
    }
    

}
