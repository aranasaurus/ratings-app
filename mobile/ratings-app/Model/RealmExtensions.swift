//
//  RealmExtensions.swift
//  ratings-app
//
//  Created by Ryan Arana on 2/14/15.
//  Copyright (c) 2015 Ryan Arana. All rights reserved.
//

import Foundation
import Realm

extension RLMResults {
    func arraySortedByProperty(propertyName: String!, ascending: Bool) -> [RLMObject] {
        return map( self.sortedResultsUsingProperty(propertyName, ascending: ascending) ) { (r: RLMObject) -> RLMObject in
            return r
        }
    }
}

extension RLMObject {

    class func addNotificationBlock(block: RLMNotificationBlock) -> RLMNotificationToken {
        return RLMRealm.defaultRealm().addNotificationBlock(block)
    }

    class func removeNotification(token: RLMNotificationToken) {
        RLMRealm.defaultRealm().removeNotification(token)
    }

    func save() {
        if let r = realm ?? RLMRealm.defaultRealm() {
            r.beginWriteTransaction()
            r.addOrUpdateObject(self)
            r.commitWriteTransaction()
        }
    }

    func delete() {
        if let r = realm {
            r.beginWriteTransaction()
            r.deleteObject(self)
            r.commitWriteTransaction()
        }
    }

}
