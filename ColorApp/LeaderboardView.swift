//
//  LeaderboardView.swift
//  ColorApp
//
//  Created by Isha Nadkarni on 7/23/20.
//  Copyright © 2020 Isha Nadkarni. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct LeaderboardView: View {
    var db = Firestore.firestore()
    @State var leaderboard = ["Leaderboard"]
    var body: some View {
        List(leaderboard, id : \.self) {Text($0)}
            .onAppear(perform : getData)
    }
    func getData () {
        db.collection("leaderboard").order(by:"score",descending:true).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("there was an error getting the documents", err)
            } else {
                for document in querySnapshot!.documents {
                    let name = document.get("name") as! String
                    let score = document.get("score") as! Int
                    self.leaderboard.append("\(name) : \(String(score))")
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
