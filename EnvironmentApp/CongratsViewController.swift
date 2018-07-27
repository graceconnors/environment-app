//
//  CongratsViewController.swift
//  EnvironmentApp
//
//  Created by Grace Connors on 7/24/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import CoreData

class CongratsViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var noPoints: [Points] = []
    var total = 0
    //var completed = false
    
    @IBOutlet weak var challengeLabel: UITextView!
    
    @IBOutlet weak var whyImpLabel: UITextView!
    
    @IBAction func challengeCompleted(_ sender: Any) {
        pickPointsAndWhy()
    }
    
    var index: Int = 0
    
    var whyStatements: [String] = ["Enough plastic is thrown away each year to circle the earth four times. By using a reusable bottle you could potentially save 1,460 plastic bottles a year!", "Riding or walking to work or school is healthier for the environment and you too! Cycling just 6 miles to work instead of driving would save 1500 kg of greenhouse gas emissions a year.","Its estimated that by 2050, there will be more plastic in the ocean than fish. The good news is that we still have time to take action and start picking up trash you see along the sidewalk, in your school or work, and even in your house.", "500 million plastic straws are used everyday but they are not even essential to life! Because of their small shape, animals mistake them as food. Straws have ended up anywhere from turtle’s noses to seal’s stomachs.  All YOU have to do to help is skip the straw!", "A plastic bag takes about 100 years to break down. Those are many years that they could float out to sea or get stuck in a gutter. Do YOU a favor and slam dunk the junk!", "Many food items you buy travel over 1500 miles to reach your plate. Local food doesn't have a carbon footprint from overseas plane travel or truck trips across countries. Save the trip and buy local!", "Sometimes even the stuff we put in garbage cans can end up in the ocean anyway. So that's why you should take the extra precaution and cut the plastic that holds packs of soda cans together before you throw them away. When the plastic connectors aren't cut, they are the perfect shape for wildlife to get tangled up in. So cut the can connections!", "In a year, a car emits 10,000 pounds of carbon dioxide and 600 pounds of carbon monoxide. That's just 1 car! Carpooling can help the environment by reducing the amount of cars on the road and therefore reducing the greenhouse gasses that we release into the air.", "A dryer is the third most energy hungry appliance in a household, right after refrigerator and washer. Line drying clothes can reduce a household’s carbon footprint by 2,600 pounds a year. Also, it can reduced the risk of a dryer fire. Lint can clog the dryer, causing more than 15,000 house fires a year.", "Americans throw away 25 million styrofoam coffee cups every year and 2.5 million bottles. Most people don't know that the styrofoam cannot completely be recycled and that most of the foam today will still be present in 500 years. The good news is if you bring your own cup then you could save 23lb worth of cups and also get discounts at some stores.", "Plant a tree because trees are beautiful and they help replace carbon dioxide into oxygen for us to breath! One tree can provide us with 260 lb. of oxygen every year!", "Turning off the water in between wetting your toothbrush and rinsing your mouth can save your family up to 10 gallons a day!", "According to the united nations scientists, meat production is the leading cause of climate change and many other environment problems.. It uses great amounts of water and erodes the soil. A great way to help our environment is to plan out a day to cook and eat all vegetarian meals!", "Packaging makes up the largest source of trash in the US. A great way to have a reusable lunch is to wrap your lunch in a sandwich cloth or use metal snack boxes that are easy to clean. By trying not to use plastic, it can also help you eat better. You might go for the homemade option rather than the store bought, pre packaged option!", "If we all turn off 2 lights in our home for an hour everyday we would save more than 5 billion kilowatts of energy nationwide each year. The amount of coal it takes to create that amount of energy could almost fill up the empire state building 3 times.", "Food waste scraps can be composted to help the next generation of produce and improve the quality of our water. Americans have recovered 23 million tons through composting in 2014 alone! You and your family can help raise that number buy starting a compost bin!"]
    
    var chosenChallenge: String = "challenge"
   
    func getData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            noPoints = try context.fetch(Points.fetchRequest()) as! [Points]
            DispatchQueue.main.async {}

        }
        catch {
            print("Couldn't fetch Data")
        }
    }
    
    func pickPointsAndWhy()
    {
        getData()
        let currentPoint = Int32(chosenChallenge.prefix(1))
        if(noPoints.count != 0){
        let total = noPoints[noPoints.count-1].numPoints + currentPoint!
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newPoint = Points(context: context)
        newPoint.numPoints = Int32(total)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
        else{
            let currentPoint = Int32(chosenChallenge.prefix(1))
            
                let total = currentPoint!
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let newPoint = Points(context: context)
                newPoint.numPoints = Int32(total)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        challengeLabel.text = chosenChallenge
        whyImpLabel.text = whyStatements[index]
       // pickPointsAndWhy()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
