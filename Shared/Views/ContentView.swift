//
//  ContentView.swift
//  Shared
//
//  Created by Abdullah Ridwan on 5/29/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sessionStore = SessionStore()
    
    init(){
        sessionStore.listen()
    }
    
    var body: some View {
        TabView{
            WorkoutList()
                .fullScreenCover(isPresented: $sessionStore.isAnon, content: {
                    Login()
                })
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Dock")
                }
            
            
            Text("Hello")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("History")
                }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
