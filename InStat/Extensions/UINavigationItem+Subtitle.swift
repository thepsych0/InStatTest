//
//  NavigationItem+Subtitle.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem {
    
    func set(mainTitle: String, subtitle: String, titleColor: UIColor) {
        
        let one = UILabel()
        one.text = mainTitle
        one.font = UIFont.boldSystemFont(ofSize: 18)
        one.textAlignment = .center
        one.textColor = titleColor
        one.sizeToFit()
        
        let two = UILabel()
        two.text = subtitle
        two.font = UIFont.systemFont(ofSize: 13)
        two.textAlignment = .center
        two.textColor = titleColor
        two.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [one, two])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        
        let width = max(one.frame.size.width, two.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        one.sizeToFit()
        two.sizeToFit()
        
        self.titleView = stackView
    }
}
