//
//  Calories.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//

import Foundation
import SwiftUI


public enum Calories: String, CaseIterable {
    case low = "low"
    case medium = "medium"
    case high = "high"
    
    func stringValue() -> String {
        switch(self) {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    var icon: String {
        switch self {
        case .low:
            return "arrow.down.right"
        case .medium:
            return "arrow.right"
        case .high:
            return "arrow.up.right"
        }
    }
}
