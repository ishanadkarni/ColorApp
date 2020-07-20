//
//  ContentView.swift
//  ColorApp
//
//  Created by Isha Nadkarni on 7/20/20.
//  Copyright © 2020 Isha Nadkarni. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:20) {
            Text("Welcome to the Color Game!").font(Font.custom("AcademyEngravedLetPlain", size: 29)).foregroundColor(Color.black)
            Text("Score: 0")
            Text("Time: 0")
            Text("Start")
            VStack(spacing:20) {
            HStack(spacing:20) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Red").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }
                .padding().frame(maxWidth:.infinity).background(Color.red).cornerRadius(15)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Green").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }
                    .padding().frame(maxWidth:.infinity).background(Color.green).cornerRadius(15)
            }
                HStack(spacing:20) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Blue").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                    }
                    .padding().frame(maxWidth:.infinity).background(Color.blue).cornerRadius(15)

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Black").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                    }
                        .padding().frame(maxWidth:.infinity).background(Color.black).cornerRadius(15)
                }
                HStack(spacing:20) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Orange").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                    }
                    .padding().frame(maxWidth:.infinity).background(Color.orange).cornerRadius(15)

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Pink").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                    }
                        .padding().frame(maxWidth:.infinity).background(Color.pink).cornerRadius(15)
                }
                HStack(spacing:20) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Purple").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                    }
                    .padding().frame(maxWidth:.infinity).background(Color.purple).cornerRadius(15)

                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Yellow").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                    }
                        .padding().frame(maxWidth:.infinity).background(Color.yellow).cornerRadius(15)
                }
            }.padding(.horizontal,20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
