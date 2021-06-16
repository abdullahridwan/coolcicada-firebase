//
//  AddWorkout.swift
//  workoutApp (iOS)
//
//  Created by Abdullah Ridwan on 6/15/21.
//

import SwiftUI

struct AddWorkout: View {
    @State var name = ""
    @State var sets = ""
    @State var reps = ""
    @State var description = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Name")){
                    TextField("Name",text: $name)
                }
                Section(header: Text("Sets and Reps")){
                    TextField("Sets", text: $sets)
                        .keyboardType(.decimalPad)
                    TextField("Reps", text: $reps)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Comments")){
                    TextEditor(text: $description)
                }
            }
            .navigationBarTitle("Create Workout")
            
            
            Button(action: {
                return
            }, label: {
                Text("Create")
            }).foregroundColor(.blue)
            
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout(name: "Jack", sets: "3", reps: "2", description: "nothing too much to add. hello Mellow Jello Fellow. Lorem Ipsum vitae")
    }
}
