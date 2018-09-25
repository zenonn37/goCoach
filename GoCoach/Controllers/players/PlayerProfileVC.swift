//
//  PlayerProfileVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/24/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class PlayerProfileVC: UIViewController {
    
    let realm = try! Realm()
    
    
    var player:Roster?
    
    
    @IBAction func backBtn(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var playerName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let id = player {
            
             let ath = realm.objects(Roster.self).filter("id = '\(id.id)'")
             //let teams = realm.objects(Team.self).filter("id = '\(tm.id)'")
            playerName.text = ath[0].first + " " + ath[0].last
        }
       
    }
    

   

}
