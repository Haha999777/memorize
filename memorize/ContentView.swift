//
//  ContentView.swift
//  memorize
//
//  Created by 11344113 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    //var emojis: Array<String> = ["A","B","C","D"]
    var emojis = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Q","R","S","T","U","V","W","X","Y","Z"]
    @State var emojiCount = 6
    
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) {emoji in CardView(content: emoji)
                }
            }
            HStack{
                Button(action: {emojiCount -= 1}, label: {Text("Remove Card")})
                Spacer()
                Button(action: {emojiCount += 1}, label: {Text("Add Card")})
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}
struct CardView: View{
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            if isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth:3)
                Text(content).font(.largeTitle)
            }
            else{
                shape
                }
            }
        //.onTapGesture (perform: {
            //isFaceUp = !isFaceUp
        //})
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
        }
    }

#Preview {
    ContentView()
        
}
