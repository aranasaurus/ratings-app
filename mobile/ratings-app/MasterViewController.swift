//
//  MasterViewController.swift
//  ratings-app
//
//  Created by Ryan Arana on 1/25/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import UIKit
import Realm

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    var realm: RLMRealm {
        return RLMRealm.defaultRealm()
    }
    var token: RLMNotificationToken = RLMNotificationToken()
    var items: [Item] {
        return Item.allObjects().arraySortedByProperty("ratingDate", ascending: false) as [Item]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
        }

        token = realm.addNotificationBlock { (notification: String!, rlm: RLMRealm!) in
            if notification == RLMRealmDidChangeNotification {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        let names = [ "Black Butte Porter", "Maker's Mark", "Big Kahuna Burger", "Ethiopian", "Pulp Fiction", "The Tick" ]
        let comments = [ "Delicious.", "Yummy!", "HUGE!", "Amazing", "Room for improvement.", "LOVE!", "meh.", "Dark, with a hint of wood afterward." ]

        let item = Item()
        item.rating = Double(arc4random_uniform(100)) * 0.01
        item.ratingDate = NSDate()
        item.name = names[Int(arc4random_uniform(UInt32(names.count-1)))]
        item.comments = comments[Int(arc4random_uniform(UInt32(comments.count-1)))]

        realm.beginWriteTransaction()
        realm.addObject(item)
        realm.commitWriteTransaction()
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = items[indexPath.row]
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                controller.item = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as ItemTableViewCell
        configureCell(cell, atIndexPath: indexPath)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = items[indexPath.row]
            realm.beginWriteTransaction()
            realm.deleteObject(item)
            realm.commitWriteTransaction()
        }
    }

    func configureCell(cell: ItemTableViewCell, atIndexPath indexPath: NSIndexPath) {
        let item = items[indexPath.row]
        cell.itemImageView.image = item.image
        cell.nameLabel.text = item.name
        cell.ratingView.value = Float(item.rating)
    }

}
