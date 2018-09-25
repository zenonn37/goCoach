//
//  TeamListVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift


class TeamListVC: UIViewController {
    
    let realm = try! Realm()
    var teams:Results<Team>?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
     fetchObjects()
        tableView.reloadData()
     

      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchObjects()
        tableView.reloadData()
        
        if ((teams?.count) != nil){
            
            print("has stuff")
        }else{
            print("empty")
        }
    }
    func fetchObjects(){
    
    teams = realm.objects(Team.self)
    }
    
    
    
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//Mark: - TableView
extension TeamListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams?.count ?? 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamList") as? TeamCell else {
            return UITableViewCell()
        }
        
        if let team = teams?[indexPath.row] {
            cell.configureTeam(team: team)
        }else{
            cell.textLabel?.text = "Empty"
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let team = teams?[indexPath.row] {
            print(team)
            performSegue(withIdentifier: "goToTeamDash", sender: self)
        }
    
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            do{
                try self.realm.write {
                    self.realm.delete((self.teams?[indexPath.row])!)
                }
                self.fetchObjects()
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }catch{
                debugPrint(error.localizedDescription)
            }
            
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            if let team = self.teams?[indexPath.row]{
                print(team)
                self.performSegue(withIdentifier: "editTeam", sender: Any?.self)
                //tableView.reloadRows(at: [indexPath], with: .automatic)
            }
           
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9562702775, green: 0.3446201547, blue: 0.3118365326, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return [deleteAction,addAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTeamDash" {
            let TeamDash = segue.destination as! TeamDashboardVC
            
            if let indexPath = tableView.indexPathForSelectedRow{
                TeamDash.teamDash = teams?[indexPath.row]
            }
        }else if segue.identifier == "editTeam" {
            let editTeam = segue.destination as! EditTeamVC
            if let indexPath = tableView.indexPathForSelectedRow{
                print(teams?[indexPath.row])
                editTeam.teamEdit = teams?[indexPath.row]
                
            }else{
                debugPrint("problem")
            }
        }
    }
    
    
    
}
