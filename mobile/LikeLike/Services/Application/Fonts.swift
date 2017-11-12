//
//  Fonts.swift
//  LikeLike
//
//  Created by Ryan Arana on 11/11/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

struct Fonts {
    private init() { }

    static let bold: UIFont = UIFont(name: "Baskerville-Bold", size: 18)!
    static let normal: UIFont = UIFont(name: "Baskerville", size: 18)!

    static func shadow(size: CGFloat = 1.25) -> NSShadow {
        return shadow(size: CGSize(width: size, height: size))
    }

    static func shadow(size: CGSize) -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = Colors.shadow
        shadow.shadowOffset = size
        return shadow
    }

    static func attributes(size: CGFloat) -> [NSAttributedStringKey: Any] {
        return [
            .font: bold.withSize(size),
            .foregroundColor: Colors.foreground
        ]
    }

    static func addShadow(size: CGSize, to attributes: [NSAttributedStringKey: Any]) -> [NSAttributedStringKey: Any] {
        var attr = attributes
        attr[.shadow] = Fonts.shadow(size: size)
        return attr
    }
    static func addShadow(size: CGFloat = 1.25, to attributes: [NSAttributedStringKey: Any]) -> [NSAttributedStringKey: Any] {
        return addShadow(size: CGSize(width: size, height: size), to: attributes)
    }
}
