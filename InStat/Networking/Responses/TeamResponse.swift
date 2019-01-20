//
//  TeamResponse.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import Foundation

class TeamResponse: Decodable {
    
    var status: String?
    var errorCode: Int?
    var errorText: String?
    var team: Team?
    
    enum CodingKeys: String, CodingKey {
        case status
        case errorCode = "error_code"
        case errorText = "error_text"
        case team = "data"
    }
}
