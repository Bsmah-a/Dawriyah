//
//  WheelPointer.swift
//  Dawriyah
//
//  Created by Shahad Alzowaid on 02/06/1445 AH.
//

//
//  File.swift
//
//
//  Created by ADyatkov on 08.09.2022.
//

//
//  File.swift
//
//
//  Created by ADyatkov on 08.09.2022.
//

import SwiftUI

@available(iOS 14.0, *)
struct WheelPointer: Shape {

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.size.width / 2,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: false)
        }
    }
}
