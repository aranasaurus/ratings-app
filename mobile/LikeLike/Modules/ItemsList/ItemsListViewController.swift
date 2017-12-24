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
    var dataSource: ItemDataSource

    private let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    private let addButton: UIButton = UIButton(type: .system)

    var itemSelected: (Item) -> Void
    var itemRemoved: (Item) -> Void
    var addItemTapped: () -> Void

    init(dataSource: ItemDataSource, itemSelected: @escaping (Item) -> Void, itemRemoved: @escaping (Item) -> Void, addItemTapped: @escaping () -> Void) {
        self.dataSource = dataSource
        self.itemSelected = itemSelected
        self.itemRemoved = itemRemoved
        self.addItemTapped = addItemTapped
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LikeLike"
        navigationItem.largeTitleDisplayMode = .never

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

        tableView.backgroundColor = Colors.lightBackground

        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.dataSource = self
        tableView.delegate = self

        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.applyTheme()
        addButton.addToBottom(of: view)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for path in tableView.indexPathsForSelectedRows ?? [] {
            tableView.deselectRow(at: path, animated: false)
        }

        reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let padding = tableView.frame.maxY - addButton.frame.maxY
        let offset = tableView.frame.maxY - addButton.frame.minY + padding
        tableView.contentInset = UIEdgeInsets(top: tableView.contentInset.top, left: tableView.contentInset.left, bottom: offset, right: tableView.contentInset.right)
    }

    func reloadData() {
        dataSource.reloadData()
        tableView.reloadData()
    }
    
    @objc private func addButtonTapped() {
        addItemTapped()
    }
}

extension ItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.item(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let item = dataSource.item(at: indexPath)
        let remove = UITableViewRowAction(style: .destructive, title: "Delete") { [unowned self] _, _ in
            let alert = UIAlertController(title: "Confirm", message: "Are you sure you want to remove \(item.title)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Remove", style: .destructive) { [unowned self] _ in
                self.itemRemoved(item)
                self.dataSource.reloadData()
                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        return [remove]
    }
}

extension ItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected(dataSource.item(at: indexPath))
    }
}
