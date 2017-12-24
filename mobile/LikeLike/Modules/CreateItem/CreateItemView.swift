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
        backgroundColor = Colors.midBackground

        title.font = Fonts.normal
        title.attributedPlaceholder = NSAttributedString(string: "Enter a title...", attributes: [
            NSAttributedStringKey.foregroundColor: Colors.highlight
        ])
        title.textColor = Colors.foreground
        title.autocapitalizationType = .words
        addSubview(title, constraints: [
            align(\.leadingAnchor, to: \.readableContentGuide.leadingAnchor, constant: 8),
            align(\.trailingAnchor, to: \.readableContentGuide.trailingAnchor, constant: -8),
            align(\.topAnchor, to: \.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        rating.minimumValue = 0
        rating.maximumValue = 5
        rating.addTarget(self, action: #selector(sliderChanged(slider:)), for: .valueChanged)
        addSubview(rating)
        rating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 32),
            rating.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            rating.trailingAnchor.constraint(equalTo: title.trailingAnchor)
        ])

        // TODO: Set up the other views.

        let save = UIButton(type: .system)
        save.setTitle("Save", for: .normal)
        save.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        save.applyTheme()
        save.addToBottom(of: self)
    }

    @objc func sliderChanged(slider: UISlider) {
        slider.value = slider.value.rounded()
    }

    @objc func saveTapped() {
        saveHandler()
    }
}
