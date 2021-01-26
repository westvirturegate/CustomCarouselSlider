//
//  CardView.swift
//  work
//
//  Created by tokumoto on 2021/01/26.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var model : CarouselViewModel
    var card : Card
    
    var body: some View {
        
        VStack{
            
            Text("Tuesday 26 January")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
            
            Text(card.title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
            
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(card.cardColor)
        .cornerRadius(25)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
