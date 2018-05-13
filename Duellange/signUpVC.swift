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
            if !isValidEmail(str:email){
                let emailAlert = UIAlertController(title: "Invalid Email Format", message: "Please enter a valid email format.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.emailTxt.text = ""
                })
                emailAlert.addAction(ok)
                self.present(emailAlert, animated: true, completion: nil)
                
            } else if pass.count < 6 {
                let passwordAlert = UIAlertController(title: "Short Password", message: "Please enter a password at least 6 characters long.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.passTxt.text = ""
                    self.repeatTxt.text = ""
                })
                passwordAlert.addAction(ok)
                self.present(passwordAlert, animated: true, completion: nil)
                
            } else if pass == pass2 {
                let name = emailFirstPart(str:email)
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    if let u = user {
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                         changeRequest?.displayName = name
                         changeRequest?.commitChanges { (error) in
                         // ...
                         }
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
