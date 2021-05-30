//
//  TodaysWorkoutView.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 5/30/21.
//

import SwiftUI

struct TodaysWorkoutView: View {
    @ObservedObject var sessionStore = SessionStore()
    let blueButton = BlueButton()
    
    var body: some View {
        VStack{
            Text(sessionStore.currentUser?.email.description ?? "No Email")
            Button(action: {
                _ = sessionStore.signOut()
            }, label: {
                Text("Sign Out")
            }).buttonStyle(blueButton)
        }
        
    }
}

struct TodaysWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysWorkoutView().environmentObject(SessionStore())
    }
}
