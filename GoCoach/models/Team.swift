//
//  Team.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import Foundation
import RealmSwift


class Team: Object {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name:String = ""
    @objc dynamic var sport:String = ""
    @objc dynamic var gender:String = ""
    @objc dynamic var season:String = ""
    @objc dynamic var level:String = ""
    @objc dynamic var location:String = ""
    
    let roster = List<Roster>()
    
    
    override static func primaryKey() -> String?{
        return "id"
    }
    
    
}
