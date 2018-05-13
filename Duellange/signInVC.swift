//
//  signInVC.swift
//  Duellange
//
//  Created by Onur Orhan on 11.04.2018.
//  Copyright © 2018 Duellange. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signInVC: UIViewController {
    @IBOutlet var goBackBtn: UIButton!
    @IBOutlet var signInBtn: UIButton!
    
    @IBOutlet var mainTitle: UILabel!
    
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        if let email = emailTxt.text, let pass = passTxt.text{
            if pass.count >= 6 {
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    self.performSegue(withIdentifier: "signInHome", sender: self)
                })
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
