//
//  ContentViewTraining.swift
//  GuessTheFlag
//
//  Created by Guye Raphael, I233 on 30.03.20.
//  Copyright © 2020 Guye Raphael. All rights reserved.
//

import SwiftUI

struct ContentViewTraining: View {
        @State private var isAlertShown = false
        
        var body: some View {
    //        VStack(alignment: .trailing, spacing: 20) {
    //            Text("Hello, World 1!")
    //            Text("Hello, World 2!")
    //            Text("Hello, World 3!")
    //        }
            
    //        VStack(alignment: .trailing, spacing: 20) {
    //            Text("Hello, World 1!")
    //            Text("Hello, World 2!")
    //            Spacer()
    //            Text("Hello, World 3!")
    //        }
            
    //        ZStack {
    //            VStack {
    //                Text("This is inside a stack")
    //            }
    //            .background(Color.red)
    //            VStack {
    //                Text("Hello World")
    //            }
    //            .background(Color.blue)
    //        }
            
    //        ZStack {
    //            Color.red
    //            Text("Your content")
    //        }
            
            VStack {
                Button("Button1") {
                    print("button1 tapped")
                }
                Button(action: {
                    print("button2 tapped")
                }) {
                    Text("Button2")
                }
                Button(action: {
                    print("button3 tapped")
                }) {
                    Image(systemName: "pencil")
                }
                Button(action: {
                    print("button4 tapped")
                }) {
                    HStack {
                        Image(systemName: "trash")
                        Text("Button 4")
                    }
                }
                Button("Show alert") {
                    self.isAlertShown = true
                }
                .alert(isPresented: $isAlertShown) {
    //                Alert(title: Text("hellooooo"),
    //                      message: Text("Hello my friend"),
    //                      dismissButton: .cancel())
                    Alert(title: Text("title"),
                          message: Text("message"),
                          primaryButton: .default(Text("default")),
                          secondaryButton: .cancel())
                }
            }
        }
}

struct ContentViewTraining_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTraining()
    }
}
