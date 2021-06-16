//
//  OneHistWorkout.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 6/13/21.
//

import SwiftUI

struct OneHistWorkout: View {
    var workout: Workout

    var body: some View {
        let sets = workout.sets
        let reps = workout.reps
        let name = workout.name

        VStack(alignment: .leading){
            //name
            Text(name)
                .font(.headline).bold()
                .foregroundColor(.primary)

            //sets and reps
            Text("Overview | Sets: \(sets) and Reps: \(reps)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
    }
}

struct OneHistWorkout_Previews: PreviewProvider {
    static var previews: some View {
        OneHistWorkout(workout: Workout(id: UUID().uuidString, name: "Test name", reps: 3, sets:5, date: Date()))
    }
}
