//
//  ItemsListViewController.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/3/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

class ItemsListViewController: UIViewController {
    private let colors: Colors
    private let tableView: UITableView
    var viewModel: ItemsListViewModel

    init(viewModel: ItemsListViewModel, colors: Colors) {
        self.viewModel = viewModel
        self.colors = colors
        self.tableView = UITableView(frame: .zero, style: .plain)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LikeLike"

        view.backgroundColor = colors.background
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.backgroundColor = colors.background

        tableView.register(cells: viewModel.cells)
        tableView.dataSource = self
    }
}

extension ItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.dataSet[indexPath.row].dequeue(from: tableView, at: indexPath)
        cell.backgroundColor = colors.background
        cell.textLabel?.textColor = colors.foreground
        return cell
    }
}
