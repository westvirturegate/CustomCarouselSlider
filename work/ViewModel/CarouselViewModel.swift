//
//  CarouselViewModel.swift
//  work
//
//  Created by tokumoto on 2021/01/09.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    @Published var cards = [
    
        Card(cardColor: Color.blue, title: "title1"),
        Card(cardColor: Color.purple, title: "title2"),
        Card(cardColor: Color.green, title: "title3"),
        Card(cardColor: Color.yellow, title: "title4"),
        Card(cardColor: Color.blue, title: "title5")
    
    ]
    
    @Published var swipedCard = 0
}


