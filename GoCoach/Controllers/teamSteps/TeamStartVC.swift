//
//  TeamStartVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/9/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class TeamStartVC: UIViewController {
    
    
    let realm = try! Realm()
      var team = TeamSteps()
    
      var walk = WalkThrough()
    var selectedPos:String?
    
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sport: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var zip: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            createSportPicker()
         createToolBar()
        // Do any additional setup after loading the view.
    }
    
    
    
   func createSportPicker(){
     let sportPicker = UIPickerView()
    sportPicker.delegate = self
    sportPicker.backgroundColor = .black
    
    sport.inputView = sportPicker
    
    }
    
    func createToolBar(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneBtn = UIBarButtonItem(title: "Finished", style: .plain, target: self, action: #selector(TeamStartVC.dismissKeyBoard))
        
        toolBar.setItems([doneBtn], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
   
    @IBAction func nextStep(_ sender: Any) {
        
        
      
        
        team.name = name.text!
        team.sport = sport.text!
        team.country = country.text!
        team.zip = zip.text!
        
        performSegue(withIdentifier: "teamNextStep", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamNextStep" {
            
            let teamStepTwoVC = segue.destination as! TeamStepTwoVC
            
            teamStepTwoVC.stepOne = team
            
            
            
        }
    }
    
}

extension TeamStartVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return walk.sportType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return walk.sportType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPos = walk.sportType[row]
        
        sport.text = selectedPos
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label:UILabel
        
        if let view = view as? UILabel {
            label = view
        }else{
            label = UILabel()
        }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 16)
        label.text = walk.sportType[row]
        
        return label
    }
    
    
}
