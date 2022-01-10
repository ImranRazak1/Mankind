//
//  ContentView.swift
//  Mankind
//
//  Created by Imran razak on 04/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        let missions: [Mission] = Bundle.main.decode("missions.json")
        let columns = [GridItem(.adaptive(minimum: 150))]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) {
                        missions in
                        NavigationLink {
                            MissionView(mission: missions, astronauts: astronaut)
                        } label: {
                            VStack {
                                Image(missions.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(missions.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(missions.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground))
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .background(.darkBackground)
            .navigationTitle("ManKind")
            .preferredColorScheme(.dark)
                
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
