//
//  NoteController.swift
//  Notester
//
//  Created by Pierre on 3/23/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import Foundation

class NoteController {
    
    static let sharedController = NoteController()
    
    
    static func createNote(title: String, text: String?, completion:(note: Note?) -> Void) {
    }
    
    static func editNote(title: String, text: String, uid: String, completion:(note: Note?) -> Void) {
    }

    static func deleteNote() {
    }
    
    static func orderNote(note: [Note]) -> [Note] {
        return []
    }
    
    
}