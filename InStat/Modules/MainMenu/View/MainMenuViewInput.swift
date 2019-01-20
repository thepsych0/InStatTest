//
//  MainMenuMainMenuViewInput.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//

protocol MainMenuViewInput: class {

    /**
        @author Edgar
        Setup initial state of the view
    */

    func setupInitialState()
    func setup(team: Team)
    func setup(matches: [Match])
}
