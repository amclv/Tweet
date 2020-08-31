//
//  AuthService.swift
//  Tweet
//
//  Created by Aaron Cleveland on 8/31/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    // creating a static allows us to only get instance once. 
    static let shared = AuthService()
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
        let username = credentials.username
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let fileName = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { url, error in
                guard let profileImageURL = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("Debug: Error is \(error.localizedDescription)")
                        return
                    }
                    // uid is what we get back if it successfully gets a user back from the database
                    guard let uid = result?.user.uid else { return }
                    let values = ["email": email, "username": username, "fullname": fullname, "profileImageURL": profileImageURL]
                    
                    // storing the user in firebase database under it's own UID.
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
