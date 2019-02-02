//
//  FirebaseManager.swift
//  newchatapp
//
//  Created by dilip kumar on 28/01/19.
//  Copyright © 2019 dilip kumar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth

class FirebaseManager: NSObject {
    static  let databaseRef = Database.database().reference()
    static var currentUserId:String = ""
    static var currentUser:Firebase.User? = nil
    
    static func Login(email:String, password:String, completion:@escaping(_ success:Bool)->Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            if let error = error{
                print(error.localizedDescription)
                print("Unsuccess")
            }else{
                currentUser = user?.user
                currentUserId = (user?.user.uid)!
                completion(true)
                print("Successfully Login")
                print("\(currentUserId)")
            }
            
        })
    }
    
    static func CreateAccount(email:String, username:String, password:String, completion:@escaping(_ result:String)-> Void){
        Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
            if let error = error{
                print(error.localizedDescription)
                print(error)
                return
            }
            else{
                FirebaseManager.AddUser(username: username, email: email)
                print("Success")
            }
            
            completion("")
        })
    
    
    
    }
    
    
    
  static  func AddUser(username:String, email:String){
        let uid = Auth.auth().currentUser?.uid
        let post = ["uid":uid!, "username":username, "email":email, "profileImageUrl":""]
        databaseRef.child("users").child(uid!).setValue(post)
        
    }

}
