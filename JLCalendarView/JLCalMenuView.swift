//
//  JLCalMenuView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/13.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalMenuView: UIView, JLCalMenu {
    
    public var calManager: JLCalManager?
    public var date: Date?
    {
        didSet{
            self.reload()
        }
    }
    var label: UILabel?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        label?.textAlignment = .center
        label?.font = UIFont.systemFont(ofSize: 16)
        label?.textColor = .black
        self.addSubview(label!)
        
    }
    
    func reload(){
        if let dateFormatter = calManager?.dateHelper.dateFormatter{
            dateFormatter.dateFormat = "yyyy MMMM"
            label?.text = dateFormatter.string(from: self.date!)
        }
    }
    
    public override func layoutSubviews() {
        label?.frame = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
