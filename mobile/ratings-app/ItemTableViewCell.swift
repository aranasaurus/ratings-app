//
//  ItemTableViewCell.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingView: UISlider!

    var item: Item = Item() {
        didSet {
            itemImageView.image = item.image
            nameLabel.text = item.name
            ratingView.value = item.rating
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func ratingChange(sender: UISlider) {
        item.updateRating(sender.value)
    }

}
