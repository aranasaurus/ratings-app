//
//  ItemDetailsView.swift
//  LikeLike
//
//  Created by Ryan Arana on 10/26/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class ItemDetailsView: UIView {
    var item: Item? {
        didSet {
            if let item = item {
                configure(for: item)
            } else {
                prepareForReuse()
            }
        }
    }

    private let rating: UILabel = UILabel()
    private let imageView: UIImageView = UIImageView()
    private let comments: UITextView = UITextView()
    // TODO: Tag List
    private let stackView: UIStackView = UIStackView()

    init(item: Item?) {
        self.item = item
        super.init(frame: .zero)

        setupSubviews()

        if let item = item {
            configure(for: item)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func prepareForReuse() {
        rating.text = nil
        imageView.image = nil
        comments.text = ""
    }

    private func setupSubviews() {
        backgroundColor = Colors.lightBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor)
        ])

        rating.textColor = Colors.foreground
        rating.font = UIFont.preferredFont(forTextStyle: .title1, compatibleWith: traitCollection)
        rating.textAlignment = .right
        stackView.addArrangedSubview(rating)

        // TODO: actually configure these
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(comments)
        // TODO: Tag List
    }

    // TODO: update fonts as needed for system preference and trait collection changes

    private func configure(for item: Item) {
        rating.text = String(format: "%0.0f stars", item.rating)
        imageView.image = UIImage(contentsOfFile: item.photoUrl?.absoluteString ?? "")
    }
}
