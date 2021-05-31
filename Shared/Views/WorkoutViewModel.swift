//
//  WorkoutViewModel.swift
//  workoutApp
//
//  Created by Abdullah Ridwan on 5/30/21.
//

import Foundation
import Firebase



//an array of the workouts for today
//current user
//database reference






struct Workout: Codable, Identifiable{
    var id: String
    var name: String
    var reps: Int
    var sets: Int
    var date: Date
}

struct AllUserInfo: Codable, Identifiable{
    var id: String
    var all_workouts = [Workout]()
    var first_name : String
    var last_name: String
}




class WorkoutViewModel: ObservableObject{
    @Published var allUserInfo = [AllUserInfo]()
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    func fetchData(){
        if(user != nil){
            db.collection("users").whereField("userID", isEqualTo: user!.uid).addSnapshotListener({(snapshot, error) in
                
                guard let documents = snapshot?.documents else {
                    print("There are no documents for this user")
                    return
                }
                
                //there should only be one document. Create the instance of that document
                self.allUserInfo = documents.map({documentSnapShot -> AllUserInfo in
                    let data = documentSnapShot.data()
                    let id = documentSnapShot.documentID
                    let first_name = data["first_name"] as? String ?? "no first name"
                    let last_name = data["last_name"] as? String ?? "no last name"
                    let raw_workouts = data["all_workouts"]! as! [Any]
                    
                    //need to convert raw_workouts to a list of workouts
                    for workout in raw_workouts {
                        print(workout)
                    }
                    
                    
                    let all_workouts = [Workout(id: "fake", name: "fake", reps: 3, sets: 3, date: Date.init())]
                    return AllUserInfo(id: id, all_workouts: all_workouts, first_name: first_name, last_name: last_name)
                })
                
            })
        }else{
            print("No valid user")
        }
    }
    
    
    
    
}
