//
//  AnimalsViewController.swift
//  EnvironmentApp
//
//  Created by Grace Connors on 7/27/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import CoreData

class AnimalsViewController: UIViewController {

    var myLevels: [Level] = []
    var myPoints: [Points] = []
    
    
    @IBOutlet weak var turtleImage1: UIImageView!
    
    @IBOutlet weak var turtleImage2: UIImageView!
    
    @IBOutlet weak var turtleImage3: UIImageView!
    
    @IBOutlet weak var pandaImage1: UIImageView!
    
    @IBOutlet weak var pandaImage2: UIImageView!
    
    @IBOutlet weak var pandaImage3: UIImageView!
    
    @IBOutlet weak var lionImage1: UIImageView!
    
    @IBOutlet weak var lionImage2: UIImageView!
    
    @IBOutlet weak var lionImage3: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        var noPoints = 0
        if(myPoints.count != 0)
        {
            noPoints = Int(myPoints[myPoints.count - 1].numPoints)
        }
        
        if(myLevels[myLevels.count - 1].levelNo == 1)
        {
            if(noPoints > 25)
            {
                turtleImage1.image = #imageLiteral(resourceName: "turtle1")
            }
            if(noPoints > 50)
            {
                turtleImage2.image = #imageLiteral(resourceName: "turtle2")
            }
        }
        if(myLevels[myLevels.count - 1].levelNo == 2)
        {
            turtleImage3.image = #imageLiteral(resourceName: "turtle3")
            if(noPoints > 25)
            {
                pandaImage1.image = #imageLiteral(resourceName: "panda1")
            }
            if(noPoints > 50)
            {
                pandaImage2.image = #imageLiteral(resourceName: "panda2")
            }
        }
        if(myLevels[myLevels.count - 1].levelNo == 3)
        {
            pandaImage3.image = #imageLiteral(resourceName: "panda3")
            
            if(noPoints > 25)
            {
                lionImage1.image = #imageLiteral(resourceName: "lion1")
            }
            if(noPoints > 50)
            {
                lionImage2.image = #imageLiteral(resourceName: "lion2")
            }
            if(noPoints >= 75)
            {
                lionImage3.image = #imageLiteral(resourceName: "lion3")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            myLevels = try context.fetch(Level.fetchRequest())
            myPoints = try context.fetch(Points.fetchRequest())
            DispatchQueue.main.async {
            }
        } catch {
            print("Couldn't fetch Data")
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
