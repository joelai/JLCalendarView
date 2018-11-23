//
//  JLCalRangeDayView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/20.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public enum JLCalDayRangeState: Int {
    case none
    case startRange
    case inRange
    case endRange
    case selected
}

@objc public class JLCalDayRangeView: UIView {
    @objc public var state : JLCalDayRangeState = .none
    {
        didSet
        {
            self.setNeedsDisplay()
        }
    }
    @objc public var selectedBackgroundColor : UIColor = .red
    @objc public var inRangeBackgroundColor :  UIColor = .orange
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let w = rect.width
        let h = rect.height
        let margin : CGFloat = 3.0
        let radius = min(w/2-margin,h/2-margin)
        let center = CGPoint.init(x: w/2, y: h/2)
        switch state {
        case .startRange:
            if let ctx = UIGraphicsGetCurrentContext() {
                let rect = CGRect.init(x: center.x, y: center.y - radius, width: w/2, height: radius*2)
                ctx.setFillColor(self.inRangeBackgroundColor.cgColor)
                ctx.fill(rect)
                let circle = CGRect.init(x: center.x-radius, y: center.y - radius, width: radius*2, height: radius*2)
                ctx.setFillColor(self.selectedBackgroundColor.cgColor)
                ctx.fillEllipse(in: circle)
                UIGraphicsEndImageContext()
            }
            break
            
        case .none:
            break
        case .inRange:
            if let ctx = UIGraphicsGetCurrentContext() {
                let rect = CGRect.init(x: 0, y: center.y - radius, width: w, height: radius*2)
                ctx.setFillColor(self.inRangeBackgroundColor.cgColor)
                ctx.fill(rect)
                UIGraphicsEndImageContext()
            }
            break
        case .endRange:
            if let ctx = UIGraphicsGetCurrentContext() {
                let rect = CGRect.init(x: 0, y: center.y - radius, width: w/2, height: radius*2)
                ctx.setFillColor(self.inRangeBackgroundColor.cgColor)
                ctx.fill(rect)
                let circle = CGRect.init(x: center.x-radius, y: center.y - radius, width: radius*2, height: radius*2)
                ctx.setFillColor(self.selectedBackgroundColor.cgColor)
                ctx.fillEllipse(in: circle)
                UIGraphicsEndImageContext()
            }
            break
        case .selected:
            if let ctx = UIGraphicsGetCurrentContext() {
                let circle = CGRect.init(x: center.x-radius, y: center.y - radius, width: radius*2, height: radius*2)
                ctx.setFillColor(self.selectedBackgroundColor.cgColor)
                ctx.fillEllipse(in: circle)
                UIGraphicsEndImageContext()
            }
            break
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc public class JLCalRangeDayView: UIView, JLCalDay {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @objc public var rangeView: JLCalDayRangeView?
    @objc public var textLabel: UILabel?
    public var isFromOtherMonth: Bool = false
    public var calManager: JLCalManager?
    public var date: Date?
    
    public func reload() {
        if rangeView == nil {
            rangeView = JLCalDayRangeView(frame: self.bounds)
            
            self.addSubview(rangeView!)
        }
        
        if textLabel == nil {
            textLabel = UILabel(frame: self.bounds)
            textLabel?.font = UIFont.systemFont(ofSize: (calManager?.settings.dayFontSize)!)
            textLabel?.textColor = .black
            textLabel?.textAlignment = .center
            
            self.addSubview(textLabel!)
        }
        
        let dateFormatter = calManager?.dateHelper.dateFormatter
        dateFormatter?.dateFormat = "dd"
        textLabel?.text = dateFormatter?.string(from: self.date!)
        textLabel?.isHidden = self.isFromOtherMonth
        rangeView?.isHidden = (textLabel?.isHidden)!
    }
    
    public override func layoutSubviews() {
        textLabel?.frame = self.bounds
        rangeView?.frame = self.bounds
    }

}
