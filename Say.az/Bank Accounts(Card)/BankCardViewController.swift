//
//  BankCardViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/25/20.
//

import UIKit

class BankCardViewController: CustomNavigationBarVC, UITableViewDelegate, UITableViewDataSource {



    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    var numberOfRow = 4
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle("bank.accounts.title".localize())
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRow
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        if indexPath.row == numberOfRow - 1 //TODO: count - 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "add.card.cell") as! AddAccountCell
            cell.addAccountAction = {
                let vc = AddAccountViewController().initialize(fromSb: .bank_account)!
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "bank.card.cell") as! BankCardCell
        cell.deleteAction = {
            self.deleteCard(at: indexPath)
        }

        cell.swipeAction = {
            for (index, cell) in self.tableView.visibleCells.enumerated() {
                if index == indexPath.row { return }
            (cell as! BankCardCell).deleteBtn.isHidden = true

            }
        }
        return cell

    }

    private func deleteCard(at indexPath: IndexPath) {
        numberOfRow -= 1
        self.tableView.performBatchUpdates {
            self.tableView.deleteRows(at: [indexPath], with: .right)
        } completion: { (_) in
            
        }


    }
}
