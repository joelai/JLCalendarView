//
//  JLCalView.swift
//  JLCalendarView
//
//  Created by Joe on 2018/6/12.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

import UIKit

@objc public class JLCalView: UIScrollView, JLCalContent {
    @objc public var calManager: JLCalManager?
    @objc public var date: Date?
}
