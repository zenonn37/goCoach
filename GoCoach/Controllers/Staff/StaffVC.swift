//
//  StaffVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/25/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class StaffVC: UIViewController {
    
    let realm =  try!  Realm()
    
    var staff: Results<Staff>?
    
   
    

    
    @IBOutlet weak var emptyTableMessage: UIView!
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createBtn(_ sender: Any) {
    }
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedTeam:Team?{
        
        didSet{
            getStaffObjects()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if staff?.count != nil {
            getStaffObjects()
            tableView.reloadData()
              tableView.isHidden = false
              emptyTableMessage.isHidden = true
        }else{
            tableView.isHidden = true
            emptyTableMessage.isHidden = false
            
        }
        
       
    }
    
    
    func getStaffObjects(){
        
        staff = selectedTeam?.staff.sorted(byKeyPath: "first", ascending: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StaffVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staff?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "staffCell") as? StaffCell else {
            return UITableViewCell()
        }
        
        if let staffs = staff?[indexPath.row]{
            cell.configureStaffCell(staff: staffs)
        }
        
        return cell
    }
    
    
}
