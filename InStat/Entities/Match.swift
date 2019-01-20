//
//  Team.swift
//  InStat
//
//  Created by ThePsych0 on 19/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import UIKit
import RealmSwift

class Match: Object, Decodable {
    
    @objc dynamic var id = Int()
    @objc dynamic var nameRu: String?
    @objc dynamic var nameEng: String?
    @objc dynamic var opponentNameRu: String?
    @objc dynamic var opponentNameEng: String?
    @objc dynamic var score = Int()
    @objc dynamic var opponentScore = Int()
    var totalScore: String
    {
        switch self.homeStatus! {
        case .home:
            return "\(score) : \(opponentScore)"
        case .away:
            return "\(opponentScore) : \(score)"
        }
    }
    @objc dynamic private var dateString: String?
    var date: Date?
    {
        guard let dateStringUnwrapped = dateString else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: dateStringUnwrapped)
    }
    @objc dynamic private var homeStatusString: String?
    var homeStatus: HomeStatus?
    {
        if homeStatusString == "vs"
        {
            return .home
        }
        else if homeStatusString == "@"
        {
            return .away
        }
        else
        {
            return nil
        }
    }
    @objc dynamic var teamId = Int()
    @objc dynamic var opponentTeamId = Int()
    var parameters = List<MatchParameter>()
    
    
    enum CodingKeys: String, CodingKey {
        case id = "f_match"
        case nameRu = "name_ru"
        case nameEng = "name_en"
        case opponentNameRu = "name_opponent_ru"
        case opponentNameEng = "name_opponent_en"
        case score
        case opponentScore = "opponent_score"
        case dateString = "match_date"
        case homeStatusString = "home_match"
        case teamId = "team_id"
        case opponentTeamId = "opp_team_id"
        case parameters = "params"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        
        self.nameRu = try container.decodeIfPresent(String.self, forKey: .nameRu) ?? ""
        
        self.nameEng = try container.decodeIfPresent(String.self, forKey: .nameEng) ?? ""
        
        self.opponentNameRu = try container.decodeIfPresent(String.self, forKey: .opponentNameRu) ?? ""
        
        self.opponentNameEng = try container.decodeIfPresent(String.self, forKey: .opponentNameEng) ?? ""
        
        self.score = try container.decodeIfPresent(Int.self, forKey: .score) ?? 0
        
        self.opponentScore = try container.decodeIfPresent(Int.self, forKey: .opponentScore) ?? 0
        
        self.dateString = try container.decodeIfPresent(String.self, forKey: .dateString) ?? ""
        
        self.homeStatusString = try container.decodeIfPresent(String.self, forKey: .homeStatusString) ?? ""
        
        self.teamId = try container.decodeIfPresent(Int.self, forKey: .teamId) ?? 0
        
        self.opponentTeamId = try container.decodeIfPresent(Int.self, forKey: .opponentTeamId) ?? 0
        
        let parameters = try container.decodeIfPresent([MatchParameter].self, forKey: .parameters) ?? []
        self.parameters.append(objectsIn: parameters)
    }
    
    enum HomeStatus
    {
        case home
        case away
    }
}

class MatchParameter: Object, Decodable {
    @objc dynamic var param = Int()
    @objc dynamic var cm = Int()
    @objc dynamic var option = Int()
    @objc dynamic var value = Double()
}
