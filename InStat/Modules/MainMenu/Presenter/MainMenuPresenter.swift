//
//  MainMenuMainMenuPresenter.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//
import RealmSwift

class MainMenuPresenter: MainMenuModuleInput, MainMenuViewOutput, MainMenuInteractorOutput {
    

    weak var view: MainMenuViewInput!
    var interactor: MainMenuInteractorInput!
    var router: MainMenuRouterInput!
    let realm = try! Realm()

    func viewIsReady() {
        let teams = realm.objects(Team.self)
        if !teams.isEmpty
        {
            view.setup(team: teams.first!)
        }
        else
        {
            interactor.getTeam(id: 287)
        }
        
        let matches = realm.objects(Match.self)
        if !matches.isEmpty
        {
            view.setup(matches: Array(matches))
        }
        else
        {
            interactor.getMatches(teamId: 287)
        }
    }
    
    func didGetTeam(team: Team?) {
        guard let teamUnwrapped = team else {
            return
        }
        
        try! realm.write {
            realm.add(teamUnwrapped)
        }

        view.setup(team: teamUnwrapped)
    }
    
    func didGetMatches(matches: [Match]?) {
        guard let matchesUnwrapped = matches else {
            return
        }
        
        try! realm.write {
            realm.add(matchesUnwrapped)
        }
        
        view.setup(matches: matchesUnwrapped)
    }
}
