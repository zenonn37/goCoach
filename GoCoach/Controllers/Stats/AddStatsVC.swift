//
//  AddStatsVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/1/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class AddStatsVC: UIViewController {
    
    let realm = try! Realm()
    
    var stats:Roster?
    
    @IBOutlet weak var passingYdsTXT: UITextField!
    @IBOutlet weak var passingTDTxt: UITextField!
    
    @IBOutlet weak var rushingTDTxt: UITextField!
    @IBOutlet weak var completionsTxt: UITextField!
    
    @IBOutlet weak var attemptsTxt: UITextField!
    
    @IBOutlet weak var rushingYdsTxt: UITextField!
    
    
    
    @IBOutlet weak var interceptionsTxt: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func completeBtn(_ sender: Any) {
        
        
        addNewStats()
        
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func addNewStats(){
        
        let stat = FootballStat()
        
        stat.passingYards = Int(passingYdsTXT.text!) ?? 0
        stat.passingAttempts = Int(attemptsTxt.text!) ?? 0
        stat.completions = Int(completionsTxt.text!) ?? 0
        stat.passingTouchDowns = Int(passingTDTxt.text!) ?? 0
        stat.rushingYards = Int(rushingYdsTxt.text!) ?? 0
        stat.rushingTouchDowns = Int(rushingTDTxt.text!) ?? 0
        
        
        
        if  let player = stats {
            do{
                
                try realm.write {
                    
                    player.footballStats.append(stat)
                    print("success")
                    dismiss(animated: true, completion: nil)
                    
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
     
    }
}
