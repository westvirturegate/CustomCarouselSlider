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
    var animation : Namespace.ID
    
    var body: some View {
        
        VStack{
            
            Text("Tuesday 26 January")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Date-\(card.id)", in: animation)
            
            HStack {
                
                Text(card.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .matchedGeometryEffect(id: "Title-\(card.id)", in: animation)
                
            }
            
            Spacer(minLength: 0)
            
            
            HStack{
                
                Spacer(minLength: 0)
                
                Text("Read More")
                
                Image(systemName: "arrow.right")
                
            }
            .foregroundColor(Color.white.opacity(0.9))
            .padding()
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            card.cardColor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation)
        )
        .onTapGesture {
            withAnimation(.spring()){
                
                model.selectedCard = card
                model.showCard.toggle()
            }
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
