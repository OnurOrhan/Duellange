//
//  signUpVC.swift
//  Duellange
//
//  Created by Onur Orhan on 11.04.2018.
//  Copyright © 2018 Duellange. All rights reserved.
//

import UIKit
import FirebaseDatabase

class signUpVC: UIViewController {
    @IBOutlet var goBackBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    
    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var passTxt: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testDatabase(_ sender: UIButton) {
        self.ref.child("Posts").childByAutoId().setValue(["name": nameTxt.text])
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
