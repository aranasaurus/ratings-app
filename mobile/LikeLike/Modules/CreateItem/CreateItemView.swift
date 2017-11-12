//
//  CreateItemView.swift
//  LikeLike
//
//  Created by Ryan Arana on 11/11/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class CreateItemView: UIView {
    let title: UITextField = UITextField()
    let rating: UISlider = UISlider()

    // TODO: All the other views

    private let stackView: UIStackView = UIStackView()

    private let saveHandler: () -> Void

    init(saveHandler: @escaping () -> Void) {
        self.saveHandler = saveHandler

        super.init(frame: .zero)

        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        backgroundColor = Colors.background

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

        title.font = Fonts.normal
        title.placeholder = "Title"
        title.textColor = Colors.foreground
        stackView.addArrangedSubview(title)
        stackView.setCustomSpacing(8, after: title)

        rating.minimumValue = 0
        rating.maximumValue = 5
        rating.addTarget(self, action: #selector(sliderChanged(slider:)), for: .valueChanged)
        stackView.addArrangedSubview(rating)

        // TODO: Set up the other views.

        let save = UIButton(type: .system)
        save.setTitle("Save", for: .normal)
        save.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        stackView.addArrangedSubview(save)
    }

    @objc func sliderChanged(slider: UISlider) {
        slider.value = slider.value.rounded()
    }

    @objc func saveTapped() {
        saveHandler()
    }
}
