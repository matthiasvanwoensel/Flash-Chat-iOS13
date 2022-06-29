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
    
    var messages: [Message] = [
        Message(sender: "test@hotmail.com", body: "Hello there"),
        Message(sender: "test2@hotmail.com", body: "Hi"),
        Message(sender: "test@hotmail.com", body: "How are you?"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        // hide back button in nav
        navigationItem.hidesBackButton = true
        // navigation title
        title = K.appName
        
        // register messageCell
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        
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

extension ChatViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for:indexPath)
        as! MessageCell
        
        cell.label.text = messages[indexPath.row].body
        return cell
        
    }
    

}
