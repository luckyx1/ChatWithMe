//
//  ChatViewController.swift
//  ChatWithMe
//
//  Created by Rob Hernandez on 2/22/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet weak var msgText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSend(_ sender: Any) {
        let message = Message(msg: msgText.text!)
        message.postMessage { (success: Bool, error: Error?) in
            if(success){
                print("Message has been sent")
            }else{
                print(error?.localizedDescription)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
