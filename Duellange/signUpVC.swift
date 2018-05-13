//
//  signUpVC.swift
//  Duellange
//
//  Created by Onur Orhan on 11.04.2018.
//  Copyright © 2018 Duellange. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpVC: UIViewController {
    @IBOutlet var goBackBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    
    @IBOutlet var mainTitle: UILabel!
    
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passTxt: UITextField!
    @IBOutlet var repeatTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(str:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str)
    }
    
    func emailFirstPart(str:String) -> String {
        let delimiter = "@"
        var token = str.components(separatedBy: delimiter)
        return (token[0])
    }
    
    @IBAction func signUp(_ sender: Any) {
        if let email = emailTxt.text, let pass = passTxt.text, let pass2 = repeatTxt.text {
            if pass == pass2/*, isValidEmail(str:email)*/ {
                //let name = emailFirstPart(str:email)
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    if user != nil {
                        /*let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = name
                        changeRequest?.commitChanges { (error) in
                            // ...
                        }*/
                        self.performSegue(withIdentifier: "signUpHome", sender: self)
                    }
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
