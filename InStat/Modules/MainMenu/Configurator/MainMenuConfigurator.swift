//
//  MainMenuMainMenuConfigurator.swift
//  InStat
//
//  Created by Edgar on 19/01/2019.
//  Copyright © 2019 InStat. All rights reserved.
//

import UIKit

class MainMenuModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MainMenuViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainMenuViewController) {

        let router = MainMenuRouter()

        let presenter = MainMenuPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainMenuInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
