//
//  ItemCell.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        backgroundColor = Colors.background.withAlphaComponent(0.57)
        textLabel?.font = Fonts.bold
        textLabel?.shadowColor = Colors.shadow
        textLabel?.shadowOffset = CGSize(width: 0.75, height: 0.75)
        textLabel?.textColor = Colors.foreground
        detailTextLabel?.textColor = Colors.subtitle
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemCell {
    func configure(with item: Item) {
        textLabel?.text = item.title
        detailTextLabel?.text = String(format: "%0.0f stars", item.rating)
    }
}
