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
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var roleTxt: UITextField!
    
    @IBOutlet weak var experience: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func create(_ sender: Any) {
        createStaff()
    }
    
    private func createStaff(){
        
        let staff = Staff()
        
        if let team = selectedTeam {
            
            do{
                try realm.write {
                    
                
                    
                 staff.first = firstName.text!
                 staff.last = lastName.text!
                 staff.experience = experience.text!
                 staff.role = roleTxt.text!
                 team.staff.append(staff)
                }
                print("saved")
                dismiss(animated: true, completion: nil)
                
            }catch{
                debugPrint(error.localizedDescription)
            }
            
          
        }
    }
    

    

}
