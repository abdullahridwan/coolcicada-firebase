//
//  WorkoutList.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 5/30/21.
//

import SwiftUI

struct WorkoutList: View {
    @ObservedObject var workoutViewModel = WorkoutViewModel()
    
    init(){
        workoutViewModel.fetchData()
        print("[WorkoutList.swift] Data Fetched...")
    }
    var body: some View {
        let all_workouts = workoutViewModel.allWorkouts
        NavigationView{
            List{
                ForEach(all_workouts){historical_workout in
                    OneWorkout(workout: historical_workout, setsDone: 0)
                }
            }
            .navigationTitle("Past Workouts")
        }
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList().environmentObject(WorkoutViewModel())
    }
}
