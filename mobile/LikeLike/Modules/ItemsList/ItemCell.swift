//
//  ItemCell.swift
//  LikeLike
//
//  Created by Ryan Arana on 9/4/17.
//  Copyright © 2017 aranasaurus. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {

}

extension ItemCell: ViewModelConfigurable {
    typealias ViewModel = ItemCellViewModel
    func configure(with viewModel: ItemCellViewModel) {
        textLabel?.text = viewModel.title
    }
}
