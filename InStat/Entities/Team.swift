//
//  Team.swift
//  InStat
//
//  Created by ThePsych0 on 19/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import UIKit
import RealmSwift

class Team: Object, Decodable {
    @objc dynamic var gender = Int()
    @objc dynamic var teamTypeName: String?
    @objc dynamic var nameRus: String?
    @objc dynamic var nameEng: String?
    @objc dynamic var country: Country?
    @objc dynamic var teamType = Int()
    let matches = List<Int>()
    @objc dynamic var photoPath: String?
    
    enum CodingKeys: String, CodingKey {
        case gender
        case teamTypeName = "team_type_name"
        case nameRus = "name_rus"
        case nameEng = "name_eng"
        case country
        case teamType = "team_type"
        case matches
        case photoPath = "photo"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.gender = try container.decodeIfPresent(Int.self, forKey: .gender) ?? 0
        
        self.teamTypeName = try container.decodeIfPresent(String.self, forKey: .teamTypeName) ?? ""
        
        self.nameRus = try container.decodeIfPresent(String.self, forKey: .nameRus) ?? ""
        
        self.nameEng = try container.decodeIfPresent(String.self, forKey: .nameEng) ?? ""
        
        self.country = try container.decodeIfPresent(Country.self, forKey: .country) ?? Country()
        
        self.teamType = try container.decodeIfPresent(Int.self, forKey: .teamType) ?? 0
        
        let matches = try container.decodeIfPresent([Int].self, forKey: .matches) ?? []
        self.matches.append(objectsIn: matches)
        
        self.photoPath = try container.decodeIfPresent(String.self, forKey: .photoPath) ?? ""
    }
}

class Country: Object, Decodable {
    @objc dynamic var id: String?
    @objc dynamic var nameRus: String?
    @objc dynamic var nameEng: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameRus = "name_rus"
        case nameEng = "name_eng"
    }
}

