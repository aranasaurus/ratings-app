//
//  CreateItemViewController.swift
//  LikeLike
//
//  Created by Ryan Arana on 11/11/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class CreateItemViewController: UIViewController {
    private var createView: CreateItemView!
    private let createItem: (Item) -> Void

    init(createItem: @escaping (Item) -> Void) {
        self.createItem = createItem

        super.init(nibName: nil, bundle: nil)
        
        title = "New Item"
        navigationItem.largeTitleDisplayMode = .always
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        createView = CreateItemView(saveHandler: { [unowned self] in
            self.validateItem()
        })
        view = createView
    }

    private func validateItem() {
        guard let title = createView.title.text, !title.isEmpty else {
            presentError("Title is required", for: createView.title)
            return
        }

        let item = Item(title: title, rating: Double(createView.rating.value))
        createItem(item)
    }

    private func presentError(_ message: String, for control: UIControl? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)

            control?.becomeFirstResponder()
        })
        present(alert, animated: true, completion: nil)
    }
}
