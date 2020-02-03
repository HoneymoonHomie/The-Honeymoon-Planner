//
//  Wishlist+CoreDataProperties.swift
//  TheHoneymoonPlanner
//
//  Created by Brandi Bailey on 2/2/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//
//

import Foundation
import CoreData


extension Wishlist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wishlist> {
        return NSFetchRequest<Wishlist>(entityName: "Wishlist")
    }

    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Wishlist {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: WishlistItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: WishlistItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
