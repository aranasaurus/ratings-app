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
    let colors: Colors

    private let title: UILabel = UILabel()
    private let rating: UILabel = UILabel()
    private let imageView: UIImageView = UIImageView()
    private let comments: UITextView = UITextView()
    // TODO: Tag List
    private let stackView: UIStackView = UIStackView()

    init(item: Item?, colors: Colors) {
        self.item = item
        self.colors = colors
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
        title.text = nil
        rating.text = nil
        imageView.image = nil
        comments.text = ""
    }

    private func setupSubviews() {
        backgroundColor = colors.background

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor).isActive = true

        title.textColor = colors.foreground
        title.backgroundColor = colors.background
        title.font = UIFont.preferredFont(forTextStyle: .largeTitle, compatibleWith: traitCollection)
        stackView.addArrangedSubview(title)
        stackView.setCustomSpacing(8, after: title)

        rating.textColor = colors.subtitle
        rating.backgroundColor = colors.background
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
        title.text = item.title
        rating.text = String(format: "%0.0f stars", item.rating)
        imageView.image = UIImage(contentsOfFile: item.photoUrl?.absoluteString ?? "")
    }
}
