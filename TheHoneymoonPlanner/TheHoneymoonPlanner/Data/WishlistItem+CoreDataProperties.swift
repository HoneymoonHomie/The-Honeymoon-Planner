//
//  WishlistItem+CoreDataProperties.swift
//  TheHoneymoonPlanner
//
//  Created by Brandi Bailey on 2/2/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//
//

import Foundation
import CoreData


extension WishlistItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WishlistItem> {
        return NSFetchRequest<WishlistItem>(entityName: "WishlistItem")
    }

    @NSManaged public var item: String?
    @NSManaged public var wishlist: Wishlist?

}
