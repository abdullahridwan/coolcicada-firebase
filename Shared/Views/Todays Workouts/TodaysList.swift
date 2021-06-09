//
//  TodaysList.swift
//  workoutApp (iOS)
//
//  Created by Abdullah Ridwan on 6/2/21.
//

import SwiftUI

struct TodaysList: View {
    let instanceOfHelper = HelperFunctions()
    
    //get data. Since local view depends on this arr, we make it state
    @State var allWorkoutsInst : [String: [Workout]]
    
    var body: some View {
        let todaysDate = instanceOfHelper.getTodayWeekDay()
        let workoutsForToday = allWorkoutsInst[todaysDate]
        
        NavigationView{
                List{
                    ForEach(workoutsForToday!){workoutItem in
                        OneWorkout(workout: workoutItem, setsDone: 0)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .navigationTitle("Workouts For Today")
                .toolbar(content: {EditButton()})
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Button")
                })
                Spacer().frame(height: 30)

        }
    }
    
    func delete(at offsets: IndexSet){
        allWorkoutsInst[instanceOfHelper.getTodayWeekDay()]?.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        allWorkoutsInst[instanceOfHelper.getTodayWeekDay()]?.move(fromOffsets: source, toOffset: destination)
    }
}

struct TodaysList_Previews: PreviewProvider {
    static var previews: some View {
        TodaysList(allWorkoutsInst: allWorkouts)
    }
}
