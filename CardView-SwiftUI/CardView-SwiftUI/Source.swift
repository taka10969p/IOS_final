//
//  Source.swift
//  CardView-SwiftUI
//
//  Created by Quentin on 2019/7/31.
//  Copyright © 2019 TotoroQ. All rights reserved.
//

import Foundation
import SwiftUI

struct Card : Identifiable {
    var id = UUID()
    
    var subtitle = "TEST"
    var title = "..."
    var backgroundImage =  "bg1"
    var briefSummary = "How VSCO brings analog authenticity to your digital shots"
    var description = desPlaceholer
}

let desPlaceholer = "NMSL"

let cardData: [Card] = [
    .init(),
    .init(),
    .init(),
    .init()
]
