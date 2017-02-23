//
//  Message.swift
//  ChatWithMe
//
//  Created by Rob Hernandez on 2/22/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse

class Message: NSObject {
    var text: String?
    var user: PFUser?
    
    init(msg: String) {
        self.text = msg
        self.user = PFUser.current()
    }
    
    init(object: PFObject){
        self.text = object["text"] as? String
        self.user  = object["user"] as? PFUser
    }
    
    func postMessage( withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let msg = PFObject(className: "Message")
        // Add relevant fields to the object
        msg["text"] = self.text
        msg["user"] = PFUser.current()
        
        // Save object (following function will save the object in Parse asynchronously)
        msg.saveInBackground(block: completion)
    }
}
