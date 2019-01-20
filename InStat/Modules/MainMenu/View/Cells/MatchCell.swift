//
//  MatchCell.swift
//  InStat
//
//  Created by ThePsych0 on 20/01/2019.
//  Copyright © 2019 Edgar. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {
    
    var match: Match?
    {
        didSet
        {
            if labels.count == 0
            {
                for i in 0...(match?.parameters.count ?? 1) - 1 + 3
                    //количество лейблов = оппонент + счёт + дата + параметры
                {
                    let textAndType = generateTextAndType(index: i)
                    addLabel(with: textAndType.attributedText, for: textAndType.type)
                }
                delegate?.didCalculate(width: labels.last!.frame.origin.x + labels.last!.frame.width + 15)
            }
            else
            {
                for i in 0...labels.count - 1
                {
                    let textAndType = generateTextAndType(index: i)
                    updateLabel(at: i, with: textAndType.attributedText)
                }
            }
        }
    }
    var padding: CGFloat = 15
    var labels: [UILabel] = []
    var delegate: MatchCellDelegate?
    
    
    private func generateTextAndType(index: Int) -> (attributedText: NSAttributedString, type: LabelType)
    {
        guard let matchUnwrapped = match else {
            return (attributedText: NSAttributedString(string: ""), type: .param)
        }
        
        switch index {
        case 0:
            return (attributedText: NSAttributedString(string: matchUnwrapped.opponentNameRu!), type: .opponentName)
        case 1:
            let attributedString = (matchUnwrapped.totalScore ).attributedStringForScore(size: 17, homeStatus: matchUnwrapped.homeStatus ?? .home)
            return (attributedText: attributedString, type: .score)
        case 2:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            let string = dateFormatter.string(from: matchUnwrapped.date!)
            return (attributedText: NSAttributedString(string: string), type: .date)
        default:
            return (attributedText: NSAttributedString(string: String(matchUnwrapped.parameters[index - 3].value)), type: .param)
        }
    }
    
    private func addLabel(with attributedText: NSAttributedString, for type: LabelType)
    {
        var newPadding = CGFloat()
        var width = CGFloat()
        switch type {
        case .opponentName:
            newPadding = 185
            width = 160
        case .score:
            newPadding = 65
            width = 40
        case .date:
            newPadding = 165
            width = 140
        case .param:
            newPadding = 85
            width = 70
        }
        
        let label = UILabel(frame: CGRect(x: padding, y: 15, width: width, height: 20))
        label.attributedText = attributedText
        
        self.contentView.addSubview(label)
        labels.append(label)
        
        padding += newPadding
    }
    
    private func updateLabel(at index: Int, with attributedText: NSAttributedString)
    {
        labels[index].attributedText = attributedText
    }
    
    private enum LabelType: Int
    {
        case opponentName
        case date
        case score
        case param
    }
}

protocol MatchCellDelegate
{
    func didCalculate(width: CGFloat)
}
