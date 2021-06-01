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

class WorkoutViewModel: ObservableObject {
    @Published var allWorkouts = [Workout]()
    @Published var first_name = ""
    @Published var last_name = ""
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    func fetchData(){
        if(user != nil){
            print("\nCurrent user id: \(user?.uid ?? "NO ID")")
            db.collection("users").whereField("userID", isEqualTo: user!.uid).addSnapshotListener({(snapshot, error) in
                //get documents
                guard let documents = snapshot?.documents else {
                    print("[WorkoutViewModel.swift] No Documents recieved")
                    return
                }
                //create array of workout objects
                //print("Type of documents: \(type(of: documents))")
                //print("Yo: \(documents[0].data()["first_name"])")
                let first_doc = documents[0].data()
                self.first_name = first_doc["first_name"] as? String ?? "No First Name"
                self.last_name = first_doc["last_name"] as? String ?? "No Last Name"
                
                //get all the workouts in the first doc
                let raw_workouts = first_doc["all_workouts"]! as! [Any]
                var all_workouts_inter = [Workout]()
                for workout in raw_workouts {
                    let workout = workout as! NSDictionary
                    let workoutId = workout["id"] as? String ?? "NO ID"
                    let workoutName = workout["name"] as? String ?? "No Workout Name!"
                    let workoutReps = workout["reps"] as? Int ?? 0//NSString)?.doubleValue ?? 0.0
                    let workoutSets = workout["sets"] as? Int ?? 0//NSString)?.doubleValue ?? 0.0
                    let timeStamp = workout["time_stamp"] as! Timestamp  //need a default provider
                    let workoutTimeStamp = timeStamp.dateValue()
                    
                    let historicalWorkout = Workout(id: workoutId, name: workoutName, reps: workoutReps, sets: workoutSets, date: workoutTimeStamp)
                    all_workouts_inter.append(historicalWorkout)
                }
                
                //set all_workouts_inter to the self property
                self.allWorkouts = all_workouts_inter
                
            })
        }else{
            print("[WorkoutViewModel.swift] No User")
        }
    }
}




















/*
class WorkoutViewModel: ObservableObject{
    @Published var allUserInfo = [AllUserInfo]()
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    func fetchData(){
        if(user != nil){
            print("[WorkoutViewModel.swift] Fetching User Data...")
            db.collection("users").whereField("userID", isEqualTo: user!.uid).addSnapshotListener({(snapshot, error) in
                print("[WorkoutViewModel.swift] Before")
                guard let documents = snapshot?.documents else {
                    print("There are no documents for this user")
                    return
                }
                print("[WorkoutViewModel.swift] After")
                print(documents)
                //there should only be one document. Create the instance of that document
                self.allUserInfo = documents.map({documentSnapShot -> AllUserInfo in
                    let data = documentSnapShot.data()
                    let id = documentSnapShot.documentID
                    let first_name = data["first_name"] as? String ?? "no first name"
                    let last_name = data["last_name"] as? String ?? "no last name"
                    let raw_workouts = data["all_workouts"]! as! [Any]
                    
                    print("[WorkoutViewModel.swift] First Name: \(first_name)")
                    print("[WorkoutViewModel.swift] Last Name: \(last_name)")
                    print("[WorkoutViewModel.swift] ID: \(id)")
                    
                    var all_workouts = [Workout]()
                    for workout in raw_workouts {
                        let workout = workout as! NSDictionary
                        let workoutId = workout["id"] as? String ?? "NO ID"
                        let workoutName = workout["name"] as? String ?? "No Workout Name!"
                        let workoutReps = (workout["reps"] as? NSString)?.doubleValue ?? 0.0
                        let workoutSets = (workout["sets"] as? NSString)?.doubleValue ?? 0.0
                        let timeStamp = workout["time_stamp"] as! Timestamp  //need a default provider
                        let workoutTimeStamp = timeStamp.dateValue()
                        
                        let historicalWorkout = Workout(id: workoutId, name: workoutName, reps: Int(workoutReps), sets: Int(workoutSets), date: workoutTimeStamp)
                        all_workouts.append(historicalWorkout)
                        
                    }
                    
                    for eachWorkout in all_workouts{
                        print("\n")
                        print("[WorkoutViewModel.swift] \(eachWorkout.id)")
                        print("[WorkoutViewModel.swift] \(eachWorkout.name)")
                        print("[WorkoutViewModel.swift] \(eachWorkout.reps)")
                        print("[WorkoutViewModel.swift] \(eachWorkout.sets)")
                        print("[WorkoutViewModel.swift] \(eachWorkout.date)")
                        let t = type(of: eachWorkout.date)
                        print("Type of Date: \(t)")
                    }
                    
                    return AllUserInfo(id: id, all_workouts: all_workouts, first_name: first_name, last_name: last_name)
                })
                
                
                
            })
        }else{
            print("No valid user")
        }
    }
    
    
    
    
}
*/
