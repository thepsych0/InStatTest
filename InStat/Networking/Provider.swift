//
//  Moya.swift
//  InStat
//
//  Created by ThePsych0 on 19/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import Foundation
import Moya

enum Provider
{
    case getTeam(id: Int)
    case getMatches(id: Int)
    case getMatchesData(teamId: Int, matchIds: [Int])
}

extension Provider: TargetType
{
    var baseURL: URL {
        return URL(string: "https://service.instatfootball.com")!
    }
    
    var path: String {
        switch self {
        case .getTeam, .getMatches, .getMatchesData:
            return "/ws.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTeam, .getMatches, .getMatchesData:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getTeam(let id):
            let params: [String : Any] = ["server": "instatfootball.com",
                                          "base": "pg_football",
                                          "login": "mobile_app",
                                          "pass": "QyMhQz5Xbhh77Lcn",
                                          "proc": "scout_team_inf",
                                          "disable_json_escaping": 1,
                                          "params": ["_p_team_id": "\(id)"]]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getMatches(let id):
            let params: [String : Any] = ["server": "instatfootball.com",
                                          "base": "pg_football",
                                          "login": "mobile_app",
                                          "pass": "QyMhQz5Xbhh77Lcn",
                                          "proc": "scout_team_match_period_1",
                                          "disable_json_escaping": 1,
                                          "params": ["_p_team_id": id,
                                                     "_p_date_from": "2018-09-01",
                                                     "_p_date_to": "2019-01-01",
                                                     "_p_limit": 10,
                                                     "_p_offset": 0]]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getMatchesData(let teamId, let ids):
            var idsString = ids.reduce("", {$0 + "\($1)" + ","})
            idsString.removeLast()
            idsString = "{" + idsString + "}"
            print(idsString)
            let params: [String : Any] = ["server": "instatfootball.com",
                                          "base": "pg_football",
                                          "login": "mobile_app",
                                          "pass": "QyMhQz5Xbhh77Lcn",
                                          "proc": "scout_team_matches_stat",
                                          "disable_json_escaping": 1,
                                          "params": ["_p_team_id": teamId,
                                                     "_p_match_arr": idsString]]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getTeam, .getMatches, .getMatchesData:
            return nil
        }
    }
    
    
}
