//
//  UserService.swift
//  Tweet
//
//  Created by Aaron Cleveland on 9/9/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject],
                let username = dictionary["username"] as? String else { return }
        }
    }
}
