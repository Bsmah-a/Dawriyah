//
//  Dawriyah.swift
//  Dawriyah
//
//  Created by Bsmah Ali on 16/05/1445 AH.
//

import Foundation
struct Dawriyah: Identifiable{
    let id: UUID = UUID()
    let address:String
    let startTime = Data()
    let endTime = Date()
    let dawriyahDay = Date()
    let notes: String
}
