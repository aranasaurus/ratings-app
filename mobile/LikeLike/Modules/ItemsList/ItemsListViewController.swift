//
//  ItemsListViewController.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/3/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

// TODO: Add New Item functionality
// TODO: Add sort functionality
// TODO: Add date added?
// TODO: Put these TODOs in github issues :P

class ItemsListViewController: UIViewController {
    var viewModel: ItemsListViewModel

    private let colors: Colors
    private let tableView: UITableView

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
        let guide = view.safeAreaLayoutGuide
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.backgroundColor = colors.background

        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for path in tableView.indexPathsForSelectedRows ?? [] {
            tableView.deselectRow(at: path, animated: false)
        }
    }
}

extension ItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.dataSet[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.configure(with: item, colors: colors)
        return cell
    }
}

extension ItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.dataSet[indexPath.row].selected()
    }
}
