//
//  ContentView.swift
//  work
//
//  Created by tokumoto on 2021/01/06.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var homeModel = CarouselViewModel()
    
    var body: some View {
        Home()
            .environmentObject(homeModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
