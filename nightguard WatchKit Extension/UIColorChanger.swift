//
//  UIColorChanger.swift
//  scoutwatch
//
//  Created by Dirk Hermanns on 02.01.16.
//  Copyright © 2016 private. All rights reserved.
//

import Foundation
import WatchKit
/*
 * Calculates the Colors for the different UI Elements
 * corresponding to current blood and time values.
 * E.g. paints the blood glucose value red if above 200.
 */
class UIColorChanger {
    
    static var GREEN : UIColor = UIColor.init(red: 0.48, green: 0.9, blue: 0, alpha: 1)
    static var YELLOW : UIColor = UIColor.init(red: 1, green: 0.94, blue: 0, alpha: 1)
    static var RED : UIColor = UIColor.init(red: 1, green: 0.22, blue: 0.11, alpha: 1)
    
    // Changes the color to red if blood glucose is bad :-/
    static func getBgColor(bg : String) -> UIColor {
        
        guard let bgNumber : Int = Int(bg) else {
            return UIColor.whiteColor()
        }
        if bgNumber > 200 {
            return RED
        } else if bgNumber > 180 {
            return YELLOW
        } else {
            return UIColor.whiteColor()
        }
    }
    
    static func getDeltaLabelColor(bgdelta : NSNumber) -> UIColor {
        
        let absoluteDelta = abs(bgdelta.intValue)
        if (absoluteDelta >= 10) {
            return RED
        } else if (absoluteDelta >= 5) {
            return YELLOW
        } else {
            return UIColor.whiteColor()
        }
    }
    
    static func getTimeLabelColor(lastUpdate : NSNumber) -> UIColor {
        
        let lastUpdateAsNSDate : NSDate = NSDate(timeIntervalSince1970: lastUpdate.doubleValue / 1000)
        let timeInterval : Int = Int(NSDate().timeIntervalSinceDate(lastUpdateAsNSDate))
        if (timeInterval > 15*60) {
            return RED
        } else if (timeInterval > 7*60) {
            return YELLOW
        } else {
            return UIColor.whiteColor()
        }
    }
}