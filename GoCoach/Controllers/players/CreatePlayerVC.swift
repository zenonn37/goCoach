//
//  CreatePlayerVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/24/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class CreatePlayerVC: UIViewController {
    
    let realm = try! Realm()
    var selectedTeam: Team?

    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var primaryPosition: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

  
    @IBAction func cancelCreate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createPlayer(_ sender: Any) {
        createPlayer()
        
    }
    
    private func createPlayer(){
        
        if let currentTeam = self.selectedTeam{
           let player = Roster()
            
            do{
                try realm.write {
                    player.first = firstName.text!
                    player.last = lastName.text!
                    player.age = ageTxt.text!
                    player.position = primaryPosition.text!
                    currentTeam.roster.append(player)
                    dismiss(animated: true, completion: nil)
                }
            }catch{
                debugPrint(error.localizedDescription)
                
                
            }
            
        }
        
    }
}
