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
    var stats:List<FootballStat>?
    
    var completions:Int = 0
    var passingYds:Int = 0
    var attempt:Int = 0
    var passingTouchDowns:Int = 0
    var interception:Int = 0;
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var position: UILabel!
    
    @IBOutlet weak var passingYards: UILabel!
    @IBOutlet weak var passingTD: UILabel!
    @IBOutlet weak var rushingTD: UILabel!
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var Completetions: UILabel!
    
    @IBOutlet weak var interceptions: UILabel!
    
    @IBOutlet weak var plays: UILabel!
    
    @IBOutlet weak var fumbles: UILabel!
    @IBOutlet weak var uniformNumber: UILabel!
    
    
    @IBOutlet weak var birthDate: UILabel!
    
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var positionPri: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let stats = FootballStat()
        
        stats.passingYards = 310
        stats.passingTouchDowns = 4
        stats.Interceptions = 1
        stats.passingAttempts = 25
        stats.rushingYards = 60
        stats.completions = 17
        
        
        do{
            try realm.write {
                realm.add(stats)
            }
        }catch{
            
        }

        */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let id = player {
            
             let ath = realm.objects(Roster.self).filter("id = '\(id.id)'")
             //let teams = realm.objects(Team.self).filter("id = '\(tm.id)'")
            playerName.text = ath[0].first + " " + ath[0].last
            position.text = ath[0].position
            uniformNumber.text = ath[0].number
            birthDate.text = ath[0].birth
            height.text = ath[0].height
            weight.text = ath[0].weight
            positionPri.text = ath[0].position
            
            getStats()
            
            
            
        }
       
    }
    
    private func getStats(){
    
    stats = player?.footballStats
        if let st = stats {
           
            for stat in st {
                print(stat.completions)
                  print(stat.passingYards)
                completions += stat.completions
                passingYds += stat.passingYards
                attempt += stat.passingAttempts
                passingTouchDowns += stat.passingTouchDowns
                interception += stat.Interceptions
                
            }
            
            passingYards.text = String(passingYds)
            Completetions.text = String(completions)
            attempts.text = String(attempt)
            passingTD.text = String(passingTouchDowns)
            
        }
        
     
    
    }
    

   
    @IBAction func addStats(_ sender: Any) {
        performSegue(withIdentifier: "statsForm", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsForm" {
            let addStats = segue.destination as! AddStatsVC            
            addStats.stats = player
            
            
        }
    }
    
}
