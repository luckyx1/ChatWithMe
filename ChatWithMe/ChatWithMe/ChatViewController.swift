//
//  ChatViewController.swift
//  ChatWithMe
//
//  Created by Rob Hernandez on 2/22/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var msgText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var messages: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)

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
    
    func onTimer() {
        self.getData()
    }
    
    func getData(){
        // Add code to be run periodically
        let query = PFQuery(className: "Message")
        query.order(byDescending: "createdAt")
        query.limit = 20
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
        if let posts = posts{
            for post in posts{
                
                self.messages.append(Message(object: post))
            }
            self.tableView.reloadData()
    
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.msg = self.messages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
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
