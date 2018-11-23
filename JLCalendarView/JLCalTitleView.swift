//
//  JLCalTitleView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalTitleView: UIView, JLCalTitle {
    
    public var calManager: JLCalManager?
    public var date: Date?
    {
        didSet{
            self.reload()
        }
    }
    @objc public var titleLabel: UILabel?
    public override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .black
        self.addSubview(titleLabel!)
    }
    
    func reload(){
        if let dateFormatter = calManager?.dateHelper.dateFormatter{
            dateFormatter.dateFormat = "yyyy MMMM"
            titleLabel?.text = dateFormatter.string(from: self.date!)
        }
        titleLabel?.font = UIFont.systemFont(ofSize: (calManager?.settings.titleFontSize)!)
    }
    
    public override func layoutSubviews() {
        titleLabel?.frame = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
