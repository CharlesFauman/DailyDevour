//
//  ViewController.swift
//  DailyDevour
//
//  Created by Ido Tamir on 11/11/17.
//  Copyright © 2017 DailyDevour. All rights reserved.
//

import UIKit

class Model {
    var pressed: Bool = false;
}

class ViewController: UIViewController {

    var model: Model = Model();
    @IBOutlet weak var helloWorld: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed() {
        model.pressed = !model.pressed;
        helloWorld.setTitle("Thanks", for: .normal);
        print(model.pressed);
    }
    


}

