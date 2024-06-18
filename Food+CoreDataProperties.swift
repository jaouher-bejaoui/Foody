//
//  Food+CoreDataProperties.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var title: String?
    @NSManaged public var calories: String?
    @NSManaged public var desc: String?
    @NSManaged public var color: String?
    @NSManaged public var isBio: Bool

}

extension Food : Identifiable {

}
