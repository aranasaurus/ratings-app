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
    private let colors: Colors

    init(item: ItemDetailsViewModel, colors: Colors) {
        detailsView = ItemDetailsView(item: item, colors: colors)
        self.colors = colors
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        detailsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}
