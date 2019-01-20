//
//  MainMenuMainMenuInitializer.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//

import UIKit

class MainMenuModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mainmenuViewController: MainMenuViewController!

    override func awakeFromNib() {

        let configurator = MainMenuModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainmenuViewController)
    }

}
