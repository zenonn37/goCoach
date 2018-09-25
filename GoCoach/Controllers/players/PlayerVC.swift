//
//  PlayerVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/23/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class PlayerVC: UIViewController {

    @IBOutlet weak var createNewPlayer: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyTableLbl: UILabel!
    
    let realm = try! Realm()
    
    var players: Results<Roster>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
      

      
    }
    
    var selectedTeam:Team?{
        
        didSet{
            fetchRoster()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if players?.count != nil {
            tableView.isHidden = false
            emptyTableLbl.isHidden = true
        }else{
            tableView.isHidden = true
            emptyTableLbl.isHidden = false
        }
        fetchRoster()
        tableView.reloadData()
        
    }
    
    func fetchRoster(){
     
       players = selectedTeam?.roster.sorted(byKeyPath: "age", ascending: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
   
    @IBAction func createNewPlayer(_ sender: Any) {
        debugPrint("new player")
        performSegue(withIdentifier: "addPlayer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "addPlayer" {
            let addPlayer =  segue.destination as! CreatePlayerVC
            addPlayer.selectedTeam = selectedTeam
        }else if segue.identifier == "playerDetail"{
            let playerDetail = segue.destination as! PlayerProfileVC
            if let indexPath = tableView.indexPathForSelectedRow{
                playerDetail.player = players?[indexPath.row]
            }
        }
    }
    
}

extension PlayerVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as? PlayerCell  else {
            return UITableViewCell()
        }
        
        if let player = players?[indexPath.row] {
            
            cell.configureCell(player: player)
            
        }else{
            cell.textLabel?.text = "Empty"
        }
        
        return cell
        
      
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if players?[indexPath.row] != nil{
            performSegue(withIdentifier: "playerDetail", sender: self)
        }
    }
    
    
    
    
}
