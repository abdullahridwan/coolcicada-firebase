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
        //Text("hello")
        NavigationView{
            List{
                ForEach(workoutViewModel.allWorkouts){work in
                    HStack{
                        Image(systemName: "flame")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.red.opacity(0.7))
                        VStack(alignment: .leading){
                            Text(work.name).font(.title)
                            Text("Sets: \(String(work.sets))").font(.title2)
                            Text("Reps: \(String(work.reps))").font(.title2)
                            Text(work.date, style: .date).font(.title3)
                        }
                        Spacer()
                    }
                }
            }.navigationTitle("Past Workouts")
        }
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList().environmentObject(WorkoutViewModel())
    }
}
