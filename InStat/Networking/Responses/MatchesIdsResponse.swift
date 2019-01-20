//
//  TeamResponse.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import Foundation

class MatchesIdsResponse: Decodable {
    
    var status: String?
    var errorCode: Int?
    var errorText: String?
    private var matchIDResponses: [MatchIdResponse]?
    var ids: [Int]?
    {
        return matchIDResponses?.map {$0.id ?? 0}
    }
    
    enum CodingKeys: String, CodingKey {
        case status
        case errorCode = "error_code"
        case errorText = "error_text"
        case matchIDResponses = "data"
    }
}

class MatchIdResponse: Decodable
{
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "f_match"
    }
}
