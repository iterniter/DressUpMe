//
//  SignUpViewController.swift
//  dressMeUp
//
//  Created by Khalil Bennani on 2018-01-20.
//  Copyright © 2018 khalil bennani. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase


class Signin: UIViewController {
    
    @IBOutlet weak var mail: UITextField!
    
    @IBOutlet weak var passOne: UITextField!
    
    @IBOutlet weak var passTwo: UITextField!
    
    @IBAction func Boutton(_ sender: Any)
    {
        if mail.text! != "" && passOne.text! != "" && passOne.text! == passTwo.text!
        {
        Auth.auth().createUser(withEmail: mail.text!, password: passOne.text!) { (user, error) in
            if user != nil
            {
               self.performSegue(withIdentifier:"versLogin", sender: self)
                
            }
            else{
                if let myError = error?.localizedDescription
                {
                    print(myError)
                }
                else
                {
                    print("Error")
                }
            }
            
            }
        }
    }
}

