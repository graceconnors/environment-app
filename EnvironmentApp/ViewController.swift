//
//  ViewController.swift
//  EnvironmentApp
//ViewController
//  Created by Sanaz Khosravi on 7/23/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var username = ""
   // var level: Level = Int32(1)
    
    var myPoints : [Points] = []
    var myLevels: [Level] = []

    
    let defaults = UserDefaults.standard
    
    func getPointsData(){
        do {
            myPoints = try context.fetch(Points.fetchRequest())
           
            DispatchQueue.main.async {
                
            }
        } catch {
            print("Couldn't fetch Data")
        }
    }
    
    func getLevelData(){
        do {
            myLevels = try context.fetch(Level.fetchRequest())
            DispatchQueue.main.async {
                
            }
        } catch {
            print("Couldn't fetch Data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (UserDefaults.standard.bool(forKey: "HasLaunchedOnce")) {
            getPointsData()
            getLevelData()
            usernameLabel.text = username
            
            let level = Level(context: context)
            level.levelNo = Int32(1)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            if !defaults.bool(forKey: "pledgeScreen") {
                let walkthroughVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PledgeViewController")
                self.present(walkthroughVC, animated: false)
                
                defaults.set(true, forKey: "pledgeScreen")
            }
            
            var currentLevel = myLevels[myLevels.count - 1].levelNo
            let length = myPoints.count
            if(length != 0)
            {
                var points = myPoints[length - 1].numPoints
                if(myLevels[myLevels.count - 1].levelNo == 1)
                {
                    animalImage.image =  #imageLiteral(resourceName: "turtle1")
                    if(points >= 25 && points < 50)
                    {
                        animalImage.image =  #imageLiteral(resourceName: "turtle2")
                    }
                    else if(points >= 50 && points < 75)
                    {
                        animalImage.image =  #imageLiteral(resourceName: "turtle3")
                    }else if(points >= 75){
                        myLevels[myLevels.count - 1].levelNo += 1
                        currentLevel = myLevels[myLevels.count - 1].levelNo
                        let newLevel = Level(context: context)
                        currentLevel += 1
                        newLevel.levelNo = currentLevel
                        (UIApplication.shared.delegate as! AppDelegate).saveContext()
                        if(currentLevel >= 2 ){
                            animalImage.image =  #imageLiteral(resourceName: "panda1")
                        }
                        points = 0
                        let result = try? context.fetch(Points.fetchRequest()) as! [Points]
                        var i = (result?.count)! - 1
                        while(i != -1){
                            context.delete(result![i])
                            i -= 1
                        }
                        
                    }
                }
                else if(myLevels[myLevels.count - 1].levelNo == 2)
                {
                    animalImage.image =  #imageLiteral(resourceName: "panda1")
                    if(points >= 25 && points < 50)
                    {
                        animalImage.image =  #imageLiteral(resourceName: "panda2")
                    }
                    else if(points >= 50 && points < 75)
                    {
                        animalImage.image =  #imageLiteral(resourceName: "panda3")
                    }else if(points >= 75)
                    {
                        
                        
                        let result = try? context.fetch(Points.fetchRequest()) as! [Points]
                        var i = (result?.count)! - 1
                            while(i != -1){
                                context.delete(result![i])
                                i -= 1
                            }
                    }
                }
                    else {
                        animalImage.image =  #imageLiteral(resourceName: "lion1")
                        if(points >= 25 && points < 50)
                        {
                            animalImage.image =  #imageLiteral(resourceName: "lion2")
                        }
                        else if(points >= 50 && points < 75)
                        {
                            animalImage.image =  #imageLiteral(resourceName: "lion3")
                        }else if(points >= 75)
                        {
                            let result = try? context.fetch(Points.fetchRequest()) as! [Points]
                            var i = (result?.count)! - 1
                            while(i != -1){
                                context.delete(result![i])
                                i -= 1
                            }
                    }
                }
                
                pointsLabel.text = "points: " + String(points)
                levelLabel.text = "level: " + String(myLevels[myLevels.count - 1].levelNo)
                progressBar.setProgress(Float(points) * 0.01, animated: false)
                
            }
            
        }
        else {
            
            // This is the first launch ever
            UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
            UserDefaults.standard.synchronize()
            let newLevel = Level(context: context)
            newLevel.levelNo = 1
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
       
    }
}
    





