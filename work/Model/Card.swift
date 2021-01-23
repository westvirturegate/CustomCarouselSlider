//
//  Card.swift
//  work
//
//  Created by tokumoto on 2021/01/09.
//

import SwiftUI


struct Card : Identifiable {
    
    var id = UUID().uuidString
    var cardColor : Color
    var offset : CGFloat = 0
    var title : String
}
