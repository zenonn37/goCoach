//
//  CreateScheduleVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/16/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class CreateScheduleVC: UIViewController {
    
    var location:Bool = false
    let realm = try! Realm()
    
    
    var selectedTeams: Team?

    @IBOutlet weak var homeGame: UILabel!
    @IBOutlet weak var awayGame: UILabel!
    @IBOutlet weak var opponent: UITextField!
    
    @IBOutlet weak var gameDate: UITextField!
    
    @IBOutlet weak var gameTime: UITextField!
    
    @IBOutlet weak var venue: UITextField!
    
    @IBOutlet weak var street: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    @IBAction func location(_ sender: UISwitch) {
        
        if sender.isOn == false {
            location = true
          homeGame.textColor = UIColor.green
         awayGame.textColor = UIColor.red
            
        }else{
             location = false
            awayGame.textColor = UIColor.green
             homeGame.textColor = UIColor.red
        }
    }
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func create(_ sender: Any) {
        createSchedule()
    }
    
   
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func createSchedule(){
        let schedule = Schedule()
        schedule.name = opponent.text!
        schedule.home = location
        schedule.eventDate = gameDate.text!
        schedule.eventTime = gameTime.text!
        schedule.venue = venue.text!
        schedule.street = street.text!
        schedule.city = city.text!
        schedule.zip = state.text!
        
        
        do{
            try realm.write {
                //realm.add(schedule)
                selectedTeams?.schedule.append(schedule)
                dismiss(animated: true, completion: nil)
            }
        }catch{
         debugPrint(error.localizedDescription)
        }
        
        
    }
    
}
