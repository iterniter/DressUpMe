//
//  ViewController.swift
//  dressMeUp
//
//  Created by Khalil Bennani on 2018-01-20.
//  Copyright © 2018 khalil bennani. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mail: UITextField!
    
    
    @IBOutlet weak var passOne: UITextField!
    
    
    @IBOutlet weak var passTwo: UITextField!
    
    
    @IBAction func send(_ sender: Any) {
    
    
    if passOne.text != "" && mail.text != "" && passOne == passTwo {
    
        Auth.auth().signIn(withEmail: mail.text!, password: passOne.text!, completion: { (user, error) in
    if user != nil
    {
    self.performSegue(withIdentifier:"navigationSignIn", sender: self)
    
    }
    })
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    }
    



