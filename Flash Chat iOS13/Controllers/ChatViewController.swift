//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import SnackBar_swift

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide back button in nav
        navigationItem.hidesBackButton = true
        // navigation title
        title = K.appName
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            // navigate back to root controller
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
    
            AppSnackBar.make(in: self.view, message: String(signOutError as! Substring), duration: .lengthLong).show()
            
        }
        
    }
    
}
