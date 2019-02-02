//
//  ViewController.swift
//  newchatapp
//
//  Created by dilip kumar on 28/01/19.
//  Copyright © 2019 dilip kumar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButton_click(_ sender: Any) {
        FirebaseManager.Login(email: email.text!, password: password.text!){(success:Bool) in
            if(success){
                self.performSegue(withIdentifier: "showProfile", sender: sender)
                print("Successfully Login")
                
                
            }
        }
    }
    
    @IBAction func createAccountButton_click(_ sender: Any) {
        FirebaseManager.CreateAccount(email: email.text!, username: username.text!, password: password.text!){
            (result:String) in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showSuccess", sender: sender)
            }
        }
    }
    
    
    


}

