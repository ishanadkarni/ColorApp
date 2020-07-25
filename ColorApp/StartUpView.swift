//
//  StartUpView.swift
//  ColorApp
//
//  Created by Isha Nadkarni on 7/24/20.
//  Copyright © 2020 Isha Nadkarni. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct StartUpView: View {
    @State var email = ""
    @State var password = ""
    @State var nextView = false
    var body: some View {
        NavigationView {
        VStack {
            Text("Welcome to the Color Game!")
                .font(.system(size: 40, weight: .black, design: .rounded))
                .multilineTextAlignment(.center)
            Text("Please Enter Your Email Address To Get Started").font(.system(.headline, design: .rounded))
                .padding(.vertical)
            TextField("johndoe@gmail.com", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
            Text("And Your Password").font(.system(.headline, design: .rounded))
            .padding(.vertical)
            SecureField("password123", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
            Button(action: {
                self.signIn()
            }) {
                Text("Sign in or Sign Up").font(.headline)
            }.foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
            if nextView == true {
                NavigationLink (destination : ContentView(player: email)) {
                    Text("Take Me To Play The Game!")
                }
            }
        }//vstack
        }
    }//body
    
    func signIn () {
        if email != "" {
            if password != "" {
                Auth.auth().signIn(withEmail : email, password: password) {
                    (authResult, error) in
                    if let error = error as? NSError {
                        print("there was an error")
                    } else {
                        print("user signed in successfully!")
                        self.nextView = true
                        let userInfo = Auth.auth().currentUser
                        let email = userInfo?.email
                    }
                }
            }
        }
    }
    
}//contentview

struct StartUpView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpView()
    }
}
