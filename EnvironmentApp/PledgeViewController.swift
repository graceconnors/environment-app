//
//  PledgeViewController.swift
//  EnvironmentApp
//
//  Created by Grace Connors on 7/24/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import CoreData

class PledgeViewController: UIViewController {
    
    var name: String = ""
    
    @IBOutlet weak var nameField: UITextField!
  
    @IBAction func submitButton(_ sender: Any) {
nameField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showWelcome") {
            name = nameField.text!
            let vc = segue.destination as! ViewController
            vc.username = name
    }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



