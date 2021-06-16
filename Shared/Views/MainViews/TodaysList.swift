//
//  TodaysList.swift
//  workoutApp (iOS)
//
//  Created by Abdullah Ridwan on 6/2/21.
//

import SwiftUI

struct TodaysList: View {
    @Binding var workoutsForToday: [Workout]
    @State private var editMode = EditMode.inactive
    private static var count = 0
    
    var body: some View {
        //let todaysDate = instanceOfHelper.getTodayWeekDay()
        //workoutsForToday = allWorkoutsInst[todaysDate]!
        
        NavigationView{
                List{
                    ForEach(workoutsForToday){workoutItem in
                        OneWorkout(workout: workoutItem, setsDone: 0)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .navigationTitle("Workouts For Today")
                .navigationBarItems(leading: EditButton(), trailing: addButton)
                .environment(\.editMode, $editMode)
            
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Button")
                })
                Spacer().frame(height: 30)

        }
    }
    
    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
        default:
            return AnyView(EmptyView())
        }
    }
    
    func onAdd(){
        //alide up form. fill out fields. adds in workout. 
        //allWorkoutsInst.append()
        print("Adding Workout")
    }
    
    func delete(at offsets: IndexSet){
        workoutsForToday.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        workoutsForToday.move(fromOffsets: source, toOffset: destination)
    }
}





struct TodaysList_Previews: PreviewProvider {
    //@State static var workoutsForTodayPreview = allWorkouts["Monday"]
    static var previews: some View {
        TodaysList(workoutsForToday: .constant(allWorkouts["Tuesday"]!))
    }
}
