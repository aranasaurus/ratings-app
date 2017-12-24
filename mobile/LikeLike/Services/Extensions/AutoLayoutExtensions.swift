//
//  AutoLayoutExtensions.swift
//  LikeLike
//
//  Created by Ryan Arana on 12/24/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

// TODO: Go back and use these extensions on the layout code that was written before these were added.

typealias Constraint = (_ child: UIView, _ parent: UIView) -> NSLayoutConstraint

func align<Anchor, Axis>(_ from: KeyPath<UIView, Anchor>, to: KeyPath<UIView, Anchor>, constant: CGFloat = 0) -> Constraint
    where Anchor: NSLayoutAnchor<Axis> {
        return { view, parent in
            view[keyPath: from].constraint(equalTo: parent[keyPath: to], constant: constant)
        }
}

func align<Anchor, Axis>(_ to: KeyPath<UIView, Anchor>, constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: to].constraint(equalTo: parent[keyPath: to], constant: constant)
    }
}


extension UIView {
    func addSubview(_ other: UIView, constraints: [Constraint]) {
        addSubview(other)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(other, self) })
    }
}
