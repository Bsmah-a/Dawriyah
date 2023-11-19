//
//  Item.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 05/05/1445 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
