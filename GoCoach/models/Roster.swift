//
//  Roster.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import Foundation
import RealmSwift



class Roster: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var first:String=""
    @objc dynamic var last:String=""
    @objc dynamic var age:String=""
    @objc dynamic var position:String=""
    
    let positions = List<Position>()
    let footballStats = List<FootballStat>()
    var team = LinkingObjects(fromType: Team.self, property: "roster")
    
    
    override static func primaryKey() -> String?{
        return "id"
    }
    
}
