//
//  CustomView.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView
{
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        
        setupViews()
    }
    
    func loadViewFromNib() -> UIView {
        let className: Swift.AnyClass = type(of:self)
        let bundle = Bundle(for: className)
        let nib = UINib(nibName: String(describing: className), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func setupViews() {}
}
