//
//  DBDataManager.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//

import Foundation
import SwiftUI
import CoreData

public class DBDataManager {
    @Environment(\.managedObjectContext) static var context
    
    static func addItem(title: String, 
                        desc: String,
                        color: String,
                        calories: String) {
        let newFood = Food(context: context)
        newFood.title = title
        newFood.desc = desc
        newFood.color = color
        newFood.calories = calories
        try? context.save()
    }
}
