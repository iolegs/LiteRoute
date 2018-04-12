//
//  MainViewController.swift
//  iOS Example
//
//  Created by v.a.prusakov on 10/04/2018.
//  Copyright © 2018 v.a.prusakov. All rights reserved.
//

import UIKit
import LightRoute

class MainViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    fileprivate var items: [ExampleModel] = ExampleModel.default

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    func setupTableView() {
        self.tableView.estimatedRowHeight = 130
        self.tableView.contentInset = .init(top: 16, left: 0, bottom: 16, right: 0)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerCell(MainTableViewCell.self)
    }
    
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! MainTableViewCell).configure(with: self.items[indexPath.row])
    }
    
}
