//
//  MainMenuMainMenuInteractorInput.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//

import Foundation

protocol MainMenuInteractorInput {
    func getTeam(id: Int)
    func getMatches(teamId: Int)
}
