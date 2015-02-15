//
//  DetailViewController.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import UIKit
import Realm

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var lastUpdatedLabel: UILabel!

    var token: RLMNotificationToken = RLMNotificationToken()
    var item: Item? = nil {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if nameLabel == nil {
            return
        }
        if let detail = item {
            nameLabel.text = detail.name
            commentsTextView.text = detail.comments
            itemImageView.image = detail.image
            ratingSlider.value = detail.rating
            lastUpdatedLabel.text = detail.ratingDate.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()

        token = Item.addNotificationBlock { (notification: String!, rlm: RLMRealm!) in
            if notification == RLMRealmDidChangeNotification {
                self.configureView()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ratingChanged(sender: UISlider) {
        item?.updateRating(sender.value)
    }

}

