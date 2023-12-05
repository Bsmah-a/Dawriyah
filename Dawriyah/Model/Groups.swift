//
//  Groups.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 16/05/1445 AH.
//

import Foundation

struct Groups: Identifiable{
    let id: UUID = UUID()
    let name: String
    let busyDays = [Date()]
    let startDay = Date()

}
