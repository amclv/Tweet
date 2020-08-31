//
//  Constants.swift
//  Tweet
//
//  Created by Aaron Cleveland on 8/31/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseDatabase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
