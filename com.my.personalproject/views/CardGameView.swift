//
//  ContentView.swift
//  com.my.personalproject
//
//  Created by Khoa Le on 6/14/22.
//

import SwiftUI

struct CardGameView: View {
    @State var playerCard = "card14";
    @State var cpuCard = "card14";
    @State var playerScore = 0;
    @State var cpuScore = 0;
    var title = "App";
    
    var body: some View {
        ZStack {
            Image("background");
            
            VStack {
                Spacer();
                Image("war_logo");
                Spacer();
                HStack {
                    Spacer();
                    Image(playerCard);
                    Spacer();
                    Image(cpuCard);
                    Spacer();
                };
                Spacer();
                Button(action: {
                    
                    print("Hello Wold");
                    let cpuRand = Int.random(in: 2...14)
                    let playerRand = Int.random(in: 2...14)
                    
                    cpuCard = "card\(cpuRand)";
                    playerCard = "card\(playerRand)";
                    if(cpuRand == playerRand) {
                        return;
                    }
                    if(cpuRand > playerRand) {
                        cpuScore += 1;
                    } else {
                        playerScore += 1;
                    }
                    
                    
                   
                },label:  {
                    Image("dealbutton")
                });
               
               
                Spacer();
                HStack{
                    Spacer();
                    VStack{
                        Text("Player")
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(16.0)
                        
                        Text(String(playerScore))
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding(16.0)
                    };
                    Spacer();
                    VStack{
                        Text("CPU")
                            .font(.title2)
                            .foregroundColor(Color.white)
                            .padding(16.0)
                        
                        Text(String(cpuScore))
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding(16.0)
                    };
                    Spacer();
                    
                }
                Spacer();
                
            }
            .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/);

          
        }
     
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView()
    }
}
