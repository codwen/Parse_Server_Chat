//
//  LoginViewController.swift
//  ParseChatServer
//
//  Created by Jetry Dumont on 10/7/18.
//  Copyright © 2018 Wendy Jean. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        
        let Username = usernameTextField.text
        let Password = passwordTextField.text
        
        
        if ((Username?.isEmpty)! || (Password?.isEmpty)!){
        }
    
        let myAlert = UIAlertController(title:"Alert",message:"OU DWE METE USERNAME OU AK PASSWORD OU", preferredStyle:UIAlertControllerStyle.alert)
        
        let okActin = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okActin)
        
        self.present(myAlert, animated: true, completion: nil)
        
    
        return
    }
    
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        
        let Username = usernameTextField.text
        let Password = passwordTextField.text
        
        if ((Username?.isEmpty)! || (Password?.isEmpty)!){
        }
        
        let myAlert = UIAlertController(title:"Alert",message:"OU DWE METE USERNAME OU AK PASSWORD OU", preferredStyle:UIAlertControllerStyle.alert)
        
        let okActin = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okActin)
        
        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
        
        
        return
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

