//
//  ContentView.swift
//  ColorApp
//
//  Created by Isha Nadkarni on 7/20/20.
//  Copyright © 2020 Isha Nadkarni. All rights reserved.
//

import SwiftUI
 
struct ContentView: View {
    @State private var buttonDisabled = true
    @State var score = 0
    @State var timer = 15
    @State var text = "Start"
    @State var color = Color.black
    @State var colorString = "black"
    @State var dictionaryOfColors = [Color.red : "red", Color.green : "green", Color.blue : "blue", Color.black : "black", Color.orange : "orange", Color.pink : "pink", Color.purple : "purple", Color.yellow : "yellow",]
    @State var listOfColors = ["red", "green", "blue", "black", "orange", "pink", "purple", "yellow"]
    var body: some View {
        VStack(spacing:20) {
            Text("Welcome to the Color Game!").font(Font.custom("AcademyEngravedLetPlain", size: 29)).foregroundColor(Color.black)
            Text("Score: \(score)").font(.headline)
            Text("Time: \(timer)").font(.headline)
            Text(text).font(.system(size: 45, weight: .bold, design: .rounded)).foregroundColor(color).onTapGesture {
                self.startGame()
            }
            VStack(spacing:20) {
            HStack(spacing:20) {
                Button(action: {self.checkButtonPress(colorOfButtonPress: "red")}) {
                    Text("Red").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.disabled(buttonDisabled)
                .padding().frame(maxWidth:.infinity).background(Color.red).cornerRadius(15)
                
                Button(action: {self.checkButtonPress(colorOfButtonPress: "green")}) {
                    Text("Green").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.disabled(buttonDisabled)
                    .padding().frame(maxWidth:.infinity).background(Color.green).cornerRadius(15)
            }
                HStack(spacing:20) {
                    Button(action: {self.checkButtonPress(colorOfButtonPress: "blue")}) {
                        Text("Blue").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.disabled(buttonDisabled)
                    .padding().frame(maxWidth:.infinity).background(Color.blue).cornerRadius(15)

                    Button(action: {self.checkButtonPress(colorOfButtonPress: "black")}) {
                        Text("Black").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.disabled(buttonDisabled)
                        .padding().frame(maxWidth:.infinity).background(Color.black).cornerRadius(15)
                }
                HStack(spacing:20) {
                    Button(action: {self.checkButtonPress(colorOfButtonPress: "orange")}) {
                        Text("Orange").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                } .disabled(buttonDisabled)
                    .padding().frame(maxWidth:.infinity).background(Color.orange).cornerRadius(15)

                    Button(action: {self.checkButtonPress(colorOfButtonPress: "pink")}) {
                        Text("Pink").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                } .disabled(buttonDisabled)
                        .padding().frame(maxWidth:.infinity).background(Color.pink).cornerRadius(15)
                }
                HStack(spacing:20) {
                    Button(action: {self.checkButtonPress(colorOfButtonPress: "purple")}) {
                        Text("Purple").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.disabled(buttonDisabled)
                    .padding().frame(maxWidth:.infinity).background(Color.purple).cornerRadius(15)

                    Button(action: {self.checkButtonPress(colorOfButtonPress: "yellow")}) {
                        Text("Yellow").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.disabled(buttonDisabled)
                        .padding().frame(maxWidth:.infinity).background(Color.yellow).cornerRadius(15)
                }
            }//vstack2
            .padding(.horizontal,20)
        }//vstack1
    }//body
    func startGame () {
        if timer == 15 {
            buttonDisabled = false
            countDown()
            putNewColor()
        }
        if timer == 0 {
            timer = 15
            score = 0
        }
    } //startGame func

    func countDown () {
        if timer > 0 {
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
                self.timer = self.timer - 1
                self.countDown()
            }
        }
        else {
            text = "Start Over"
            buttonDisabled = true
        }
    } //countdown func
    
    func putNewColor () {
        color = dictionaryOfColors.keys.randomElement()! //chooses new text color
        colorString = dictionaryOfColors[color]! //updates colorString
        if let index = listOfColors.firstIndex(of: colorString) {
            listOfColors.remove(at: index) //update text to be name of color shown
            text = listOfColors.randomElement()!
            listOfColors.append(colorString)
            print("color string", colorString)
            print("text", text)
        }
    }//newColor func
    
    func checkButtonPress(colorOfButtonPress : String) {
        if colorOfButtonPress == colorString {
            print("upping score")
            score = score + 1
            self.putNewColor()
        }
    }//checkButtonPress func
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
