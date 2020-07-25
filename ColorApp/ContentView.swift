//
//  ContentView.swift
//  ColorApp
//
//  Created by Isha Nadkarni on 7/20/20.
//  Copyright © 2020 Isha Nadkarni. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct ContentView: View {
    @State private var buttonDisabled = true
    @State var player : String
    @State var score = 0
    @State var timer = 15
    @State var text = "Start"
    @State var color = Color.black
    @State var colorString = "black"
    @State var dictionaryOfColors = [Color.red : "red", Color.green : "green", Color.blue : "blue", Color.black : "black", Color.orange : "orange", Color.pink : "pink", Color.purple : "purple", Color.yellow : "yellow",]
    @State var listOfColors = ["red", "green", "blue", "black", "orange", "pink", "purple", "yellow"]
    var db = Firestore.firestore()
    var body: some View {
            VStack(spacing:20) {
                HStack {
                    NavigationLink (destination : InstructionsView()){
                        Text("Instructions").font(.system(size: 20, weight: .bold, design: .rounded))
                        Image(systemName: "info.circle").font(.system(size: 20))
                        }.foregroundColor(.white).padding().background(Color.blue).cornerRadius(20)//instructions link
                    NavigationLink (destination : LeaderboardView()){
                    Text("Leaderboard").font(.system(size: 20, weight: .bold, design: .rounded))
                    Image(systemName: "text.bubble").font(.system(size: 20))
                    }.foregroundColor(.white).padding().background(Color.blue).cornerRadius(20)//leaderboard link
                }//hstack
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
                    .navigationBarTitle("Welcome to the color game!", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
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
            self.checkScoreAndUpload()
        }
    } //countdown func
    
    func checkScoreAndUpload () {
        let docRef = db.collection("leaderboard").document(player)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if var highScore = document.get("score") as? Int {
                    print("userhighscore", highScore)
                    if self.score > highScore {
                        //new highscore, upload to firebase
                        self.uploadScore ()
                    }
                }
            } else {
                print("document does not exist")
                self.uploadScore()
            }
        }
    }
        
        func uploadScore () {
            db.collection("leaderboard").document(player).setData([
                "name" : player,
                "score" : score
            ]){
                err in
                if let err = err {
                    print("error writing in the document")
                }
                else {
                    print("document successfully written!")
                }
            }
        }
    
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
        ContentView(player: "Isha")
    }
}
