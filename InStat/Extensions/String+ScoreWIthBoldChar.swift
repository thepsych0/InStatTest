//
//  String+ScoreWIthBoldChar.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    func attributedStringForScore(size: CGFloat, homeStatus: Match.HomeStatus) -> NSAttributedString
    {
        let range = homeStatus == .home ? NSRange(location: 0, length: 1) : NSRange(location: self.count - 1, length: 1)
        let attributedString = NSMutableAttributedString(string: self)
        
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: size), range: range)
        
        return attributedString
    }
}
