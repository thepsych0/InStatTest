//
//  TeamView.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import UIKit

@IBDesignable
class TeamView: CustomView {

    @IBOutlet weak var teamLogoBackgroundView: UIView!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    
    override func setupViews() {
        super.setupViews()
        teamLogoBackgroundView.layoutIfNeeded()
        teamLogoBackgroundView.layer.masksToBounds = true
        teamLogoBackgroundView.layer.cornerRadius = teamLogoBackgroundView.frame.height/2
    }
}
