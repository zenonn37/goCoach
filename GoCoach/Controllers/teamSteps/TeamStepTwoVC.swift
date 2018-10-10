//
//  teamStepTwoVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/9/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class TeamStepTwoVC: UIViewController {
    
    
    var stepOne:TeamSteps?

    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = stepOne?.name
         
       
    }
    


}
