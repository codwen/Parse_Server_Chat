//
//  ChatViewController.swift
//  ParseChatServer
//
//  Created by Jetry Dumont on 10/7/18.
//  Copyright © 2018 Wendy Jean. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var messageTextFiel: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [PFObject]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.getMessages), userInfo: nil, repeats: true)
        
        // Auto size row height based on cell autolayout constraints
        tableView.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        tableView.estimatedRowHeight = 50


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = messageTextFiel.text ?? ""
        chatMessage["user"] = PFUser.current()
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.messageTextFiel.text = ""
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cell.messageLabel.text = messages[indexPath.row]["text"] as? String
        
        if let user = messages[indexPath.row]["user"] as? PFUser {
            // User found! update username label with username
            cell.userLabel.text = user.username
        } else {
            // No user found, set default username
            cell.userLabel.text = "ok"
        }
        
        return cell
    }
    
    @objc func getMessages() {
        let query = PFQuery(className: "Message")
        query.order(byDescending: "createdAt")
        query.includeKey("user")
        
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                self.messages = []
                for obj in objects! {
                    if (obj["text"]) != nil && (obj["text"] as! String).characters.count > 0 {
                        self.messages.append(obj)
                    }
                }
                self.messages = objects!
                
                self.tableView.reloadData()
            } else {
                // Log details of the failure
                print("Error: \(error!.localizedDescription)")
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
