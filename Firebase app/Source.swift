//
//  Source.swift
//  CardView-SwiftUI
//
//  Created by Quentin on 2019/7/31.
//  Copyright © 2019 TotoroQ. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Card : Identifiable, Codable, Hashable {
    @DocumentID var id : String?
    
    var subtitle = "TEST"
    var title = "..."
    var backgroundImage =  "bg1"
    var briefSummary = "How VSCO brings analog authenticity to your digital shots"
    var description = desPlaceholer
    var date = Date()
}

let desPlaceholer = "NMSL"


//let cardData: [Card] = []
