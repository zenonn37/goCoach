//
//  StaffProfile.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/25/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class StaffProfile: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    let realm = try! Realm()
    
    var staff:Staff?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let id = staff{
            
            let stf = realm.objects(Staff.self).filter("id = '\(id.id)'")
            
            name.text = stf[0].first + " " + stf[0].last
        }
        
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
