//
//  WorkoutList.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 5/30/21.
//

import SwiftUI

struct WorkoutList: View {
    @ObservedObject var wvm = WorkoutViewModel()
    
    init(){
        wvm.fetchData()
        print("data has been fetched...")
    }
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(wvm.allUserInfo){userInfo in
                    ForEach(userInfo.all_workouts){workout in
                        VStack{
                            Text(workout.name)
                        }
                    }
                }
            }.navigationTitle("AllWorkouts")
        }
    }
}

struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList().environmentObject(WorkoutViewModel())
    }
}
