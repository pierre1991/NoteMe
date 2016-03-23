//
//  UserController.swift
//  Notester
//
//  Created by Pierre on 3/23/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import Foundation

class UserController {
    
    static let sharedController = UserController()
    
    
    static func userForIdentifier(identifier: String, completion:(user: User?) -> Void) {
    }
    
    static func fetchAllUsers(completion:(user: [User]) -> Void) {
    }
    
    static func createUser(name: String, phonenumber: Int, image: NSObject?, completion:(success: Bool, user: User?) -> Void) {
    }
    
    static func editUser(name: String, image: NSObject?, completion:(success: Bool, user: User?) -> Void) {
    }
    
    static func logoutUser() {
    }
    
    static func deleteUser() {
    }
    
    
    
}
