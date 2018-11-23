//
//  JLCalDayView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalDayView: UIView,JLCalDay {
    @objc public var textLabel : UILabel?
    @objc public var circleView : UIView?
    public var isFromOtherMonth: Bool = false
    public var calManager: JLCalManager?
    public var date: Date?
    
    public func reload() {
        if circleView == nil {
            circleView = UIView()
            self.addSubview(circleView!)
            circleView?.isHidden = true
            circleView?.backgroundColor = calManager?.settings.dayViewCircleBackgroundColor
        }
        
        if textLabel == nil {
            textLabel = UILabel()
            textLabel?.font = UIFont.systemFont(ofSize: (calManager?.settings.dayFontSize)!)
            textLabel?.textColor = .black
            textLabel?.textAlignment = .center
            
            self.addSubview(textLabel!)
        }
        
        let dateFormatter = calManager?.dateHelper.dateFormatter
        dateFormatter?.dateFormat = "dd"
        textLabel?.text = dateFormatter?.string(from: self.date!)
        textLabel?.isHidden = self.isFromOtherMonth
    }
    
    public override func layoutSubviews() {
        if textLabel == nil {return}
        let width = self.frame.size.width
        let height = self.frame.size.height
        textLabel?.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        let circleRedius = min(width, width)/2-3.0
        var circleRect = circleView?.frame
        circleRect = CGRect.init(x: self.frame.width/2-circleRedius, y: self.frame.height/2-circleRedius, width: circleRedius*2, height: circleRedius*2)
        circleView?.frame = circleRect!
        circleView?.layer.cornerRadius = circleRedius
    }
    
    
}
