//
//  OneWorkout.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 6/1/21.
//
import SwiftUI

struct OneWorkout: View {
    var workout: Workout
    @State var setsDone: Int
    

    
    var body: some View {
        let sets = workout.sets
        let reps = workout.reps
        let name = workout.name
        let range = Range(uncheckedBounds: (0, sets))

        VStack(alignment: .leading){
            //name
            Text(name)
                .font(.headline).bold()
                .foregroundColor(.primary)

            //sets and reps
            Text("Overview | Sets: \(sets) and Reps: \(reps) | Sets Done: \(setsDone)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            //hstack of circles
            HStack{
                ForEach(range){set in
                    TappableCircle(tapped: false, setsDone: $setsDone)
                        //.padding(.leading, 50)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)
                        .onTapGesture {
                        }
                }
                Spacer()
            }
            .offset(y: 2)
        }
        //.padding(5)

    }
}

struct OneWorkout_Previews: PreviewProvider {
    static var previews: some View {
        OneWorkout(workout: Workout(id: UUID().uuidString, name: "Test name", reps: 3, sets:5, date: Date()), setsDone: 0)
    }
}
