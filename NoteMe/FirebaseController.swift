//
//  FirebaseController.swift
//  Notester
//
//  Created by Pierre on 3/22/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    //MARK: Firebase URL
    static let base = Firebase(url: "https://notester1980.firebaseio.com")
    
    
    static func dataAtURL(endpoint: String, completion:(data: AnyObject?) -> Void) {
        let baseForEndpoint = FirebaseController.base.childByAppendingPath(endpoint)
        
        baseForEndpoint.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if snapshot.value is NSNull {
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
        })
    }
}


protocol FirebaseType {
    var identifier: String? {get set}
    var endpoint: String {get}
    var jsonValue: [String:AnyObject] {get}
    
    init?(jsonValue: [String:AnyObject], identifier: String)
    
    mutating func save()
    func delete()
}

extension FirebaseType {
    
    mutating func save() {
        var endpointBase: Firebase
        
        if let identifier = self.identifier {
            endpointBase = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(identifier)
        } else {
            endpointBase = FirebaseController.base.childByAppendingPath(endpoint).childByAutoId()
            //self.identifier = newEndpoint.key
        }
        endpointBase.updateChildValues(self.jsonValue)
    }
    
    
    func delete() {
        if let identifier = self.identifier {
            let endpointBase = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(identifier)
            endpointBase.removeValue()
        }
    }
}
