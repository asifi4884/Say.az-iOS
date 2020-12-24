//
//  BankSelectViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//

import UIKit

class BankSelectViewController: CustomNavigationBarVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bankListInput: DropdownInputView! {
        didSet {
            bankListInput.list = ["Kapital bank", "ATB", "VTB bank", "Express bank", "Unibank"]
        }
    }
    @IBOutlet weak var tableHeight: NSLayoutConstraint! {
        didSet {
            tableHeight.constant = 0.0
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bankListInput.selectedItem = { (index, item) in
            self.tableView.reloadData {
                self.tableHeight.constant = self.tableView.contentSize.height*2
            }

        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "account.cell") as! AccounCardCell
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AccounCardCell
        guard cell.icon.isHidden else { return }
        tableView.visibleCells.forEach( { ($0 as? AccounCardCell)?.deSelect()})
        tableView.deselectRow(at: indexPath, animated: false)
        cell.select()
    }


}
