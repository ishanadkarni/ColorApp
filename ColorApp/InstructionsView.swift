//
//  InstructionsView.swift
//  ColorApp
//
//  Created by Isha Nadkarni on 7/22/20.
//  Copyright © 2020 Isha Nadkarni. All rights reserved.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack (spacing : 20) {
            Text("Instructions:").font(.largeTitle)
            Text("You have 15 seconds to get the most points possible!").font(.system(size: 25, weight: .heavy, design: .rounded)).multilineTextAlignment(.center)
            Text("Click on the button with the color of the text, not the button with the text itself.").font(.system(size: 30, weight: .regular, design: .default)).multilineTextAlignment(.center)
            Text("yellow").foregroundColor(.blue).font(.system(size: 50, weight: .black, design: .rounded))
            Text("For example, this would be blue...").font(.system(size: 20, weight: .semibold, design: .rounded))
            Text("blue").foregroundColor(.orange).font(.system(size: 60, weight: .black, design: .rounded))
            Text("And this would be orange!").font(.system(size: 20, weight: .semibold, design: .rounded))
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
