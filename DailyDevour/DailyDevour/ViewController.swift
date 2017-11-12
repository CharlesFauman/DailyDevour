//
//  ViewController.swift
//  DailyDevour
//
//  Created by Ido Tamir on 11/11/17.
//  Copyright © 2017 DailyDevour. All rights reserved.
//

import UIKit

class LogInController: UIViewController {
    
    @IBOutlet weak var log_in_button: UIButton!
    @IBOutlet weak var username_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func accountExists(username: String, password: String) -> Bool {
        
        //Connect to database to check that accounts exists
        
        return true;
    }
    
    func createErrorAlert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func logInAttempt() {
        
        guard let username = username_field.text, username != "" else {
            createErrorAlert(message: "Username must be filled in");
            return;
        }
        
        guard let password = password_field.text, password != "" else {
            createErrorAlert(message: "Password must be filled in");
            return;
        }
        
        guard accountExists(username: username, password: password) else {
            createErrorAlert(message: "Username and password do not exist");
            return;
        }
        
        username_field.text = "";
        password_field.text = "";
        performSegue(withIdentifier: "LogInToMap", sender: self);
    }
    

}

