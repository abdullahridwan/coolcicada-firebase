//
//  SessionStore.swift
//  workoutApp (iOS)
//
//  Created by Abdullah Ridwan on 5/30/21.
//

import Foundation
import FirebaseAuth

struct User{
    var uid: String
    var email: String
}


class SessionStore: ObservableObject{
    @Published var isAnon = true //should default be set to false
    @Published var currentUser: User?
    @Published var alertMessage: String?
    
    var handle: AuthStateDidChangeListenerHandle?
    var authRef = Auth.auth()
    
    func listen(){
        print("Listening.....")
        handle = authRef.addStateDidChangeListener({(auth, user) in
            if let user = user {
                //user is logged in
                self.isAnon = false
                self.currentUser = User(uid: user.uid, email: user.email!)
            }else{
                self.isAnon = true
                self.currentUser = nil
            }
        })
    }
    
    
    func unbind(){
        if let handler = handle {
            authRef.removeStateDidChangeListener(handler)
        }
    }
    
    
    func isEmailValid(_ email: String) -> Bool {
        let name = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let domain = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegEx = name + "@" + domain + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }

    
    func signIn(email: String, password: String){
        authRef.signIn(withEmail: email, password: password){ auth, error in
            if error != nil {
                print(error.debugDescription)
            }else{
                print("sign up sucessful!")
            }
        }
        /*if isEmailValid(email){
            authRef.signIn(withEmail: email, password: password)
        }else{
            self.alertMessage = "Email is not valid!"
        }*/
    }
    
    
    func signOut() -> Bool {
        do{
            try authRef.signOut()
            self.currentUser = nil
            self.isAnon = true
            return true
        }catch{
            self.alertMessage = "Trouble Signing Out"
            return false
        }
    }
    
    
    func signUp(email: String, password: String){
        authRef.createUser(withEmail: email, password: password){ auth, error in
            print(error ?? "No error; Sign Up Sucessful")
        }
    }
    
    func create_user(email: String, password: String, completion: @escaping(_ res: Bool) -> Void ) {
      authRef.createUser(withEmail: email, password: password) { (user, error) in
        if let error = error {
          // Error creating new user.
          completion(false)
          print("Error creating user \(error)")
        } else {
          // Create successfully.
          completion(true)
        }
      }
    }
    
    
    
    
    
}




