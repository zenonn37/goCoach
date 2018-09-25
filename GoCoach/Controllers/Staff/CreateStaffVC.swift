//
//  CreateStaffVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/25/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class CreateStaffVC: UIViewController {
    
    let realm = try! Realm()
    
    var selectedTeam:Team?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    private func createStaff(){
        
        let staff = Staff()
        
        if let team = selectedTeam {
            
            do{
                try realm.write {
                    
                    
                 team.staff.append(staff)
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
            
          
        }
    }
    

    

}
