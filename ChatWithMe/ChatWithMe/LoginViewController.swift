//
//  LoginViewController.swift
//  ChatWithMe
//
//  Created by Rob Hernandez on 2/20/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        if(validateDidFill()){
            let newUser = PFUser()
            newUser.username = emailLabel.text!
            newUser.password = passwordLabel.text!
            newUser.signUpInBackground { (success: Bool, failure: Error?) in
                if success{
                    print("yay, created a User")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                }else{
                    print("sign up fail")
                }
            }
        }
        
    }
    
    @IBAction func onLogIN(_ sender: Any) {
        if(validateDidFill()){
            PFUser.logInWithUsername(inBackground: emailLabel.text!, password: passwordLabel.text!) { (user: PFUser?, failure: Error?) in
                if let user = user{
                    print("login. User is \(user)")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }else{
                    print("not logged in")
                }
            }
        }

    }
    
    func validateDidFill() -> Bool{
        let alertController = UIAlertController(title: "Please fill in all fields", message: "Do not leave email or password blank", preferredStyle: .alert)
        // create a cancel action
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        if didNotFill(){
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            return false
        }else{
            return true
        }
    }
    
    func didNotFill() -> Bool{
        return ((self.emailLabel.text?.isEmpty)! || (self.passwordLabel.text?.isEmpty)!)
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
