//
//  Colors.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

struct Colors {
    let background: UIColor?
    let foreground: UIColor?
    let highlight: UIColor?

    private init(background: UIColor?, foreground: UIColor?, highlight: UIColor?) {
        self.background = background
        self.foreground = foreground
        self.highlight = highlight
    }

    static var `default`: Colors {
        return Colors(
            background: UIColor(named: "BackgroundColor"),
            foreground: UIColor(named: "ForegroundColor"),
            highlight: UIColor(named: "HighlightColor")
        )
    }
}
