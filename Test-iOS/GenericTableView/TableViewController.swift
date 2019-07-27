//
//  TableViewController.swift
//  Test-iOS
//
//  Created by Rafael Damasceno on 27/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSoruce: TableViewDataSoruce
    init(dataSoruce: TableViewDataSoruce) {
        self.dataSoruce = dataSoruce
        
        super.init(nibName: "TableViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        dataSoruce.model.items.forEach {
            tableView.register(type(of: $0).nib, forCellReuseIdentifier: type(of: $0).reuseId)
            tableView.register(type(of: $0).cell, forCellReuseIdentifier: type(of: $0).reuseId)
        }
    }
    
    private func setupTableView() {
        
        tableView.dataSource = dataSoruce
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
        self.tableView.tableFooterView = UIView()
    }
}
