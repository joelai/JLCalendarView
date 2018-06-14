//
//  JLCalDayView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalDayView: UIView,JLCalDay {
    var label : UILabel?
    public var isFromOtherMonth: Bool = false
    public var calManager: JLCalManager?
    public var date: Date?
    
    public func reload() {
        if label == nil {
            label = UILabel()
            label?.font = UIFont.systemFont(ofSize: 14)
            label?.textColor = .black
            label?.textAlignment = .center
            
            self.addSubview(label!)
        }
        
        let dateFormatter = calManager?.dateHelper.dateFormatter
        dateFormatter?.dateFormat = "dd"
        label?.text = dateFormatter?.string(from: self.date!)
        label?.isHidden = self.isFromOtherMonth
    }
    
    public override func layoutSubviews() {
        if label == nil {return}
        label?.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    
    
}
