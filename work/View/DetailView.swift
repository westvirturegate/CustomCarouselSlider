//
//  DetailView.swift
//  work
//
//  Created by tokumoto on 2021/01/27.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var model: CarouselViewModel
    var animation : Namespace.ID
    
    var body: some View {
        
        VStack {
            
            Text("Tuesday 26 January")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Date-\(model.selectedCard.id)", in: animation)
            
            HStack {
                
                Text(model.selectedCard.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)
                
            }
            
            Spacer(minLength: 0)
            
        }
        .background(
            model.selectedCard.cardColor
                .cornerRadius(25)
                .matchedGeometryEffect(id: "bgColor-\(model.selectedCard.id)", in: animation)
                .ignoresSafeArea(.all, edges: .bottom)
            
        )
        .onTapGesture {
            withAnimation(.spring()){
                
                model.showCard.toggle()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
