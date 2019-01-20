//
//  MainMenuMainMenuInteractor.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class MainMenuInteractor: MainMenuInteractorInput {
    
    weak var output: MainMenuInteractorOutput!
    var manager: Manager
    {
        return Manager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: CustomServerTrustPoliceManager()
        )
    }
    var provider: MoyaProvider<Provider>
    {
        return MoyaProvider<Provider>(manager: manager,
                                      plugins: [NetworkLoggerPlugin(verbose: true)])
    }

    func getTeam(id: Int)
    {
        
        provider.request(.getTeam(id: id)) { [weak self] result in
            switch result {
            case let .success(response):
                let teamResponse = try! JSONDecoder().decode(TeamResponse.self, from: response.data)
                self?.output.didGetTeam(team: teamResponse.team)
            case .failure(let error):
                print(error.errorDescription ??  "Unknown Error")
                self?.output.didGetTeam(team: nil)
            }
        }
    }
    
    func getMatches(teamId: Int)
    {
        getMatchIds(teamId: teamId)
    }
    
    private func getMatchIds(teamId: Int)
    {
        provider.request(.getMatches(id: teamId)) { [weak self] result in
            switch result {
            case let .success(response):
                let matchesIdsResponse = try! JSONDecoder().decode(MatchesIdsResponse.self, from: response.data)
                self?.getMatchData(teamId: teamId, matchIds: matchesIdsResponse.ids ?? [])
                self?.output.didGetMatches(matches: nil)
            case .failure(let error):
                print(error.errorDescription ??  "Unknown Error")
                self?.output.didGetTeam(team: nil)
            }
        }
    }
    
    private func getMatchData(teamId: Int, matchIds: [Int])
    {
        provider.request(.getMatchesData(teamId: teamId, matchIds: matchIds)) { [weak self] result in
            switch result {
            case let .success(response):
                let matchesResponse = try! JSONDecoder().decode(MatchesResponse.self, from: response.data)
                self?.output.didGetMatches(matches: matchesResponse.matches)
            case .failure(let error):
                print(error.errorDescription ??  "Unknown Error")
                self?.output.didGetTeam(team: nil)
            }
        }
    }
}
