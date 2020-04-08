//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Guye Raphael, I233 on 27.03.20.
//  Copyright © 2020 Guye Raphael. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswerId = Int.random(in: 0...2)
    @State private var selectedAnswerId = 0
    
    @State private var isWon = false
    @State private var isScoreDisplayed = false
    
    var blueGradientTop = Color.init(red: 85/255, green: 129/255, blue: 241/255)
    var blueGradientBottom = Color.init(red: 17/255, green: 83/255, blue: 252/255)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [blueGradientTop, blueGradientBottom]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                
                Spacer()
                
                VStack {
                    Text("Tap the flag of :")
                        .foregroundColor(.white)
                    Text(countries[correctAnswerId])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { i in
                    Button(action: {
                        if !self.isScoreDisplayed || !self.isWon {
                            print("flag \(i) tapped!")
                            self.flagTapped(i)
                        }
                    }) {
                        Image(self.countries[i])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 20)
                    }
                }
                
                Spacer()
                    
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(isWon ? "Correct!" : "Wrong answer...")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                            Text("This is the flag of \(countries[selectedAnswerId])")
                                .foregroundColor(Color.white)
                                .font(.headline)
                        }

                        if isWon {
                            Spacer()
                            
                            Button(action: {
                                self.reset()
                            }) {
                                Image(systemName: "arrow.2.circlepath")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            }
                        }
                    }

                    HStack {
                        Spacer()
                        
                            Button(action: {
                                self.reset()
                            }) {
                                Image(systemName: isWon ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .font(.system(size: 140))
                                .foregroundColor(.white)
                            }
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(20.0)
                .cornerRadius(10)
                .background(isWon ? Color.green : Color.red)
                .edgesIgnoringSafeArea(.all)
                .opacity(isScoreDisplayed ? 1 : 0)
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedAnswerId = number
        isWon = selectedAnswerId == correctAnswerId;
        isScoreDisplayed = true
    }
    
    func reset() {
        isScoreDisplayed = false
        countries = countries.shuffled()
        correctAnswerId = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
