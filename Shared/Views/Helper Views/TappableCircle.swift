//
//  TappableCircle.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 6/1/21.
//


import SwiftUI

struct TappableCircle: View {
    @State var tapped = false
    @Binding var setsDone: Int

    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded({ self.tapped ? (self.setsDone = self.setsDone - 1) : (self.setsDone = self.setsDone + 1)})
            .onEnded { _ in self.tapped = !self.tapped }
    }

    var body: some View {
        Circle()
            .fill(self.tapped ? Color.green : Color.red)
            .frame(width: 30, height: 30)
            .gesture(tap)
        /*VStack {
            Text("Sets Done = \(self.setsDone)")
            Circle()
                .fill(self.tapped ? Color.green : Color.red)
                .frame(width: 30, height: 30)
                //.shadow(color: self.tapped ? Color.blue.opacity(0.4) : Color.red.opacity(0.4), radius: 4, x: 0, y: 2)
                //.shadow(color: Color.gray.opacity(0.3), radius: 2, x: 0, y: 1)
                .gesture(tap)
        }*/
    }
}



struct TappableCircle_Previews: PreviewProvider {
    static var previews: some View {
        TappableCircle(setsDone: .constant(1))
        //setsDone: .constant(1)
    }
}
