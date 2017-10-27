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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemCell {
    func configure(with viewModel: ItemCellViewModel, colors: Colors) {
        textLabel?.text = viewModel.title
        detailTextLabel?.text = viewModel.rating

        backgroundColor = colors.background
        textLabel?.textColor = colors.foreground
        detailTextLabel?.textColor = colors.subtitle
    }
}
