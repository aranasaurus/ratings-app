//
//  ViewController.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/3/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let colors: Colors

    init(colors: Colors) {
        self.colors = colors
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LikeLike"

        view.backgroundColor = colors.background
        let label = UILabel()
        view.addSubview(label)

        label.text = "💖 I LikeLike you! 💖"
        label.textAlignment = .center
        label.font = UIFont(name: "Baskerville", size: 32)
        label.textColor = colors.highlight
        label.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = view.safeAreaLayoutGuide
        label.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.333).isActive = true
        label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
    }
}
