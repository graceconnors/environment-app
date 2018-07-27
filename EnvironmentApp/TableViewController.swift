//
//  TableViewController.swift
//  EnvironmentApp
//
//  Created by Sanaz Khosravi on 7/23/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var myTable: UITableView!
    
    var myArray : [String] = ["3 - use a reusable water bottle", "8 - ride your bike to school/work", "3 - pick up trash that you see", "4 - don't use  a plastic straw with your drink", "5 - bring reusable bags to the store", "6 - buy local produce", "6 - cut plastic can connectors when you throw them away", "7 - carpool", "8 - line dry your clothes", "4 - bring your own cup to the coffee shop", "9 - plant a tree", "2 - turn off the water when brushing your teeth", "8 - go vegetarian for a day", "3 - pack your lunch in reusable boxes", "3 - turn all the lights off when you leave your house", "6 - compost your food"]
    
    var challenges : [Challenge] = []
    var challenge : String = ""
    var challengeIndex: Int = 0

    func getData(){
        do {
            challenges = try context.fetch(Challenge.fetchRequest())
         
            DispatchQueue.main.async {
                self.myTable.reloadData()
            }
        } catch {
            print("Couldn't fetch Data")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.bool(forKey: "HasLaunchedOnce")) {
            getData()
            
        } else {
            var i = 0
            // This is the first launch ever
            UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
            UserDefaults.standard.synchronize()
            while (i < myArray.count){
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let newChallenge = Challenge(context: context)
                newChallenge.challengeName = myArray[i]
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                i += 1
        }
    }
 //       performSegue(withIdentifier: "mySegue", sender: Any?.self)
    }
    
 
    
    func tableView(tableView: UITableView, didSelectRowAt: NSIndexPath)
    {
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!)
        challenge = (currentCell?.textLabel?.text)!
        challengeIndex = myArray.index(of: challenge)!
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "myCell", for:
            indexPath) as UITableViewCell
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mySegue"){
            let vc = segue.destination as! CongratsViewController
            vc.chosenChallenge = ((sender as! UITableViewCell).textLabel?.text)!
            vc.index = myArray.index(of: ((sender as! UITableViewCell).textLabel?.text)!)!
        }
    }
    
    @objc func checkboxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }


}
