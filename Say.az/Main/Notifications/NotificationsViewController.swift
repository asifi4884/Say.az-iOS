//
//  NotificationsViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/9/21.
//

import UIKit

class NotificationsViewController: CustomNavigationBarVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var titleView: TitleView!

    var list: [String] = ["500 AZN balansınıza yükləndi:10.09.2020",
                          "Xəbərdarlıq!:18.11.2020",
                          "3,200 AZN balansınıza yükləndi:21.11.2020",
                          "Xəbərdarlıq!:26.11.2020"]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CommonTableViewCell", bundle: nil), forCellReuseIdentifier: "income.cell")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle("")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "income.cell") as! CommonTableViewCell
        // remove this logic
        if indexPath.row % 2 != 0 {
            cell.imgView?.image = #imageLiteral(resourceName: "warning")
            cell.imgView?.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.02745098039, blue: 0.02745098039, alpha: 1)
            cell.imgView.contentMode = .scaleAspectFit
            cell.imgView?.layer.cornerRadius = 14
        } else {
            cell.imgView?.image = #imageLiteral(resourceName: "income")
            cell.imgView.contentMode = .scaleAspectFit
            cell.imgView?.backgroundColor = #colorLiteral(red: 0.09019607843, green: 0.5058823529, blue: 0.02352941176, alpha: 1)
            cell.imgView?.layer.cornerRadius = 14
        }
        cell.name.text = list[indexPath.row].components(separatedBy: ":").first
        cell.date.text = ""
        cell.amount.text = ""
        cell.voen.text = list[indexPath.row].components(separatedBy: ":")[1]

        return cell
    }


}

