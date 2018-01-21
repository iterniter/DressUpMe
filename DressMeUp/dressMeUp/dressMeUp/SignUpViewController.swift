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


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var usernameFeild: UITextField!
    
    @IBOutlet weak var passwordFeild: UITextField!
    
    
    @IBAction func boutonDeConnection(_ sender: Any) {
        
      
        if passwordFeild.text != "" && usernameFeild.text != ""{
    
            Auth.auth().signIn(withEmail: usernameFeild.text!, password: passwordFeild.text!, completion: { (user, error) in
                if user != nil
                {
                    self.performSegue(withIdentifier:"navigation", sender: self)
                }
                
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("Error")
                    }
                }
            
                })
        }
    }
}
