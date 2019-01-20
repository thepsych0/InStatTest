//
//  MainMenuMainMenuViewController.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, MainMenuViewInput {
    

    var output: MainMenuViewOutput!
    
    @IBOutlet weak var teamView: TeamView!
    @IBOutlet weak var matchesTableView: UITableView!
    @IBOutlet weak var contentWidthConstraint: NSLayoutConstraint!
    
    var team = Team()
    var matches = [Match]()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchesTableView.tableFooterView = UIView()
        matchesTableView.register(UINib(nibName: "MatchCell", bundle: nil), forCellReuseIdentifier: "MatchCell")
        
        output.viewIsReady()
    }


    // MARK: MainMenuViewInput
    func setupInitialState() {}
    
    func setup(team: Team) {
        self.team = team
        let mainTitle = team.nameRus ?? ""
        let subTitle = team.country?.nameRus ?? ""
        self.navigationItem.set(mainTitle: mainTitle, subtitle: subTitle, titleColor: UIColor.white)
        teamView.teamLogoBackgroundView.isHidden = false
        if let photoPathUnwrapped = team.photoPath
        {
            teamView.teamLogoImageView.downloadImage(from: photoPathUnwrapped)
        }
    }
    
    func setup(matches: [Match]) {
        self.matches = matches
        matchesTableView.reloadData()
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchesTableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchCell
        cell.delegate = self
        cell.match = matches[indexPath.row]
        return cell
    }
}

extension MainMenuViewController: MatchCellDelegate
{
    func didCalculate(width: CGFloat) {
        if width > contentWidthConstraint.constant
        {
            contentWidthConstraint.constant = width
        }
    }
}
