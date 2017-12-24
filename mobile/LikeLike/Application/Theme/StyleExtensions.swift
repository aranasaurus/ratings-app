//
//  StyleExtensions.swift
//  LikeLike
//
//  Created by Ryan Arana on 12/24/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit


extension UIButton {
    func applyTheme() {
        backgroundColor = Colors.foreground.withAlphaComponent(0.88)
        layer.cornerRadius = 8
        var attr = Fonts.attributes(size: 36)
        attr[.foregroundColor] = Colors.background
        let shadow = Fonts.shadow()
        shadow.shadowColor = Colors.lightBackground
        attr[.shadow] = shadow
        let buttonTitle = NSAttributedString(string: title(for: .normal)!, attributes: attr)
        setAttributedTitle(buttonTitle, for: .normal)
    }

    func addToBottom(of view: UIView) {
        view.addSubview(self, constraints: [
            align(\.centerXAnchor),
            align(\.bottomAnchor, to: \.safeAreaLayoutGuide.bottomAnchor, constant: -14)
        ])
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.66)
        ])
    }
}
