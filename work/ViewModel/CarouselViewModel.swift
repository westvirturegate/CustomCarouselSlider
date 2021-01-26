//
//  CarouselViewModel.swift
//  work
//
//  Created by tokumoto on 2021/01/09.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    @Published var cards = [
    
        Card(cardColor: Color.blue, title: "My First Card Title"),
        Card(cardColor: Color.purple, title: "My Second Card Title"),
        Card(cardColor: Color.green, title: "My Third Card Title"),
        Card(cardColor: Color.yellow, title: "My Fourth Card Title"),
        Card(cardColor: Color.blue, title: "My Fifth Card Title")
    
    ]
    
    @Published var swipedCard = 0
}


