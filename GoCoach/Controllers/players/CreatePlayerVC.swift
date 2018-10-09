//
//  CreatePlayerVC.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/24/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import UIKit
import RealmSwift

class CreatePlayerVC: UIViewController {
    
    let realm = try! Realm()
    var selectedTeam: Team?
    
    let positions = [
    
       "QB",
       "HB",
       "WR",
       "TE",
       "FL",
       "FB",
       "C",
       "G",
       "T",
       "DL",
       "DE",
       "LB",
       "CB",
       "SS",
       "K",
       "P"
       
    
    
    ]
    
    var selectedPos:String?

    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var primaryPosition: UITextField!
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var birth: UITextField!
    @IBOutlet weak var number: UITextField!
    
    
    
    private var datePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPositionPicker()
        createToolBar()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreatePlayerVC.dateChanged(datePicker:)), for: .valueChanged)
        birth.inputView = datePicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreatePlayerVC.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
      
    }
    
    
    
    func createPositionPicker(){
        let posPicker = UIPickerView()
        posPicker.delegate = self
        posPicker.backgroundColor = .black
        
        primaryPosition.inputView = posPicker
    }
    
    func createToolBar(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action:#selector(CreatePlayerVC.dismissKeyboard))
        
        toolBar.setItems([doneBtn], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        primaryPosition.inputAccessoryView = toolBar
        
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        
        birth.text = dateFormat.string(from: datePicker.date)
        
        view.endEditing(true)
    }
    

  
    @IBAction func cancelCreate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createPlayer(_ sender: Any) {
        createPlayer()
        
    }
    
    private func createPlayer(){
        
        if let currentTeam = self.selectedTeam{
           let player = Roster()
            
            do{
                try realm.write {
                    
                    
                    player.first = firstName.text!
                    player.last = lastName.text!
                    player.age = ageTxt.text!
                    player.birth = birth.text!
                    player.height = height.text!
                    player.weight = weight.text!
                    player.position = primaryPosition.text!
                    player.number = number.text!
                    currentTeam.roster.append(player)
                    dismiss(animated: true, completion: nil)
                }
            }catch{
                debugPrint(error.localizedDescription)
                
                
            }
            
        }
        
    }
}

extension CreatePlayerVC: UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return positions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return positions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPos = positions[row]
        
        primaryPosition.text = selectedPos
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        
        if let view = view as? UILabel {
            label = view
        }else{
            label = UILabel()
        }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = positions[row]
        
        return label
    }
}
