//
//  AccountDash.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit

class AccountDash: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func newTeam(_ sender: Any) {
        //performSegue(withIdentifier: "newTeam", sender: self)
        
        performSegue(withIdentifier: "newTeam", sender: self)
    }
    
    @IBAction func teamList(_ sender: Any) {
        
        performSegue(withIdentifier: "teamList", sender: self)
    }
    
    

}
