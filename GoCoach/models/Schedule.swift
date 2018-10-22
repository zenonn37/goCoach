//
//  Schedule.swift
//  GoCoach
//
//  Created by Christopher Crowd on 10/16/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import Foundation
import RealmSwift


class Schedule: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var  eventDate:String = ""
    @objc dynamic var  eventTime:String = ""
    @objc dynamic var name:String = ""
     //@objc dynamic var location:String = ""
     @objc dynamic var street:String = ""
     @objc dynamic var city:String = ""
     @objc dynamic var zip:String = ""
     @objc dynamic var venue:String = ""
     @objc dynamic var home:Bool = false
     @objc dynamic var creation = Date()
     @objc dynamic var teamScore:Int = 0
     @objc dynamic var opponentScore:Int = 0
     @objc dynamic var win:Int = 0
     @objc dynamic var lose:Int = 0
     @objc dynamic var tie:Int = 0
     @objc dynamic var played:Bool = false
     @objc dynamic var result:String = "TBD"

    
    var team = LinkingObjects(fromType: Team.self, property: "schedule")
    
    override static func primaryKey() -> String{
      return "id"
    }
    
    
}

