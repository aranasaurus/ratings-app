//
//  ItemDetailsViewController.swift
//  LikeLike
//
//  Created by Ryan Arana on 10/26/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class ItemDetailsViewController: UIViewController {
    private let detailsView: ItemDetailsView

    init(item: Item) {
        detailsView = ItemDetailsView(item: item)
        super.init(nibName: nil, bundle: nil)
        title = item.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always

        view.addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: view.topAnchor),
            detailsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailsView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}
