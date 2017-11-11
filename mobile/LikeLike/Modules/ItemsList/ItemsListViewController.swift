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
    private var items: [Item] = []

    private let tableView: UITableView

    var itemSelected: (Item) -> Void

    init(items: [Item], itemSelected: @escaping (Item) -> Void) {
        self.items = items
        self.itemSelected = itemSelected
        self.tableView = UITableView(frame: .zero, style: .plain)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LikeLike"

        view.backgroundColor = Colors.background
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
        ])

        tableView.backgroundColor = Colors.background

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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.configure(with: item)
        return cell
    }
}

extension ItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected(items[indexPath.row])
    }
}
