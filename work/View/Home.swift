//
//  Home.swift
//  work
//
//  Created by tokumoto on 2021/01/09.
//

import SwiftUI

//MARK: width
var width = UIScreen.main.bounds.width

struct Home: View {
    
    @EnvironmentObject var model : CarouselViewModel
    
    var body: some View {
        VStack{
            
            HStack{
                
                Button(action: {
                    
                    
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.gray)
                })
                
                Text("Hello Swift")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.leading)
                
                Spacer()
            }
            .padding()
        
            ZStack{
                
                ForEach(model.cards.indices.reversed(), id: \.self){ index in
                    
                    HStack {
                        model.cards[index].cardColor
                            .frame(width: getCardWidth(index: index), height: getCardHeight(index: index))
                            .cornerRadius(25)
                            .offset(x: getCardOffset(index: index))
                            .rotationEffect(.init(degrees: getCardRotation(index: index)))
                        
                        Spacer(minLength: 0)
                    }
                    .frame(height: 400)
                    .contentShape(Rectangle())
                    .offset(x: model.cards[index].offset)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ (value) in
                                    onChanged(value: value, index: index)
                                    
                                })
                                .onEnded({ (value) in
                                    onEnd(value: value, index: index)
                                }))
                }
            }
            .padding(.top, 25)
            .padding(.horizontal, 30)
            
            Spacer()
        }
    }
    
    func onChanged(value: DragGesture.Value, index: Int) {
        
        //only left swipe
        if value.translation.width < 0 {
            
            model.cards[index].offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value, index: Int) {
        
        //model.cards[index].offset = 0
        
        withAnimation{
            
            if -value.translation.width > width / 3 {
                
                model.cards[index].offset = -width
            }
            else{
                
                model.cards[index].offset = 0
            }
        }
        
    }
    
    
    //MARK: get card rotation
    
    func getCardRotation(index: Int) -> Double {
        
        let boxWidth = Double(width / 3)
        
        let offset = Double(model.cards[index].offset)
        
        let angle : Double = 5
        
        return (offset / boxWidth) * angle
    }
    
    
    func getCardHeight(index: Int) -> CGFloat {
        
        let height : CGFloat = 400
        
        let cardHeight = index <= 2 ? CGFloat(index) * 35 : 70
        
        return height - cardHeight
    }
    
    
    
    func getCardWidth(index: Int) -> CGFloat {
        
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        
        //let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        
        return boxWidth //- cardWidth
    }
    
    
    func getCardOffset(index: Int) -> CGFloat {
        
        return index <= 2 ? CGFloat(index) * 30 : 60
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
