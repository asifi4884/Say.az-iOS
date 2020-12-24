//
//  TableView+Reload.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//

import UIKit

extension UITableView {
  func reloadData(completion:@escaping ()->()) {
      UIView.animate(withDuration: 0, animations: { self.reloadData() })
          { _ in completion() }
  }
}
