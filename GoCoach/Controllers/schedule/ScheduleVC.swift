//
//  ScheduleVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/16/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class ScheduleVC: UIViewController {
    
    let realm = try! Realm()
    //var schedule: Results<Schedule>?
    var schedule:List<Schedule>?
    
    //var array = ["Monday","Tuesday","Wednsday","Thursday","Friday"]
    
    var selectedTeam:Team?{
        
        didSet{
            getSchedule()
        }
    }

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
          tableview.delegate = self
          tableview.dataSource = self
        
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if schedule?.count != 0{
            getSchedule()
            tableview.reloadData()
            tableview.isHidden = false
        }else{
            tableview.isHidden = true
        }
    }
    
    
    private func getSchedule(){
        
        //schedule = realm.objects(Schedule.self)
       schedule = selectedTeam?.schedule
    
    }
    
    
    

  
    @IBAction func newGame(_ sender: Any) {
        
        performSegue(withIdentifier: "createSchedule", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createSchedule"{
            let createSchedule = segue.destination as? CreateScheduleVC
            
            createSchedule?.selectedTeams = selectedTeam
        }
    }
    
}

extension ScheduleVC: UITableViewDataSource, UITableViewDelegate{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "schedule") as? ScheduleCell else {
            return UITableViewCell()
        }
        
        
        if let sch = schedule?[indexPath.row] {
            
            cell.configureCell(schedule: sch)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let sch = schedule?[indexPath.row] {
            
            print(sch.name)
        }
    }
}
