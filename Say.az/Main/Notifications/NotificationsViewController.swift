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

    var list: [String] = ["dsas", "asdfasf", "asdfasdfasdf"]


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
        return cell
    }


}

