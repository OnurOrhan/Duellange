//
//  homeVC.swift
//  Duellange
//
//  Created by Onur Orhan on 13.05.2018.
//  Copyright © 2018 Duellange. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class homeVC: UIViewController {
    @IBOutlet var signOutBtn: UIButton!
    
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var centerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "signOutMain", sender: self)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
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
