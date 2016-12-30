//
//  Helpers.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/30/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

extension UIViewAnimationCurve {
    func toOptions() -> UIViewAnimationOptions {
        return UIViewAnimationOptions(rawValue: UInt(rawValue << 16))
    }
    var optionsValue: UIViewAnimationOptions {
        switch (self) {
        case .easeIn:
            return .curveEaseIn;
        case .easeInOut:
            return .curveEaseInOut;
        case .easeOut:
            return .curveEaseOut;
        case .linear:
            return .curveLinear;
        }
    }
}

extension UIColor {
    static var appColor: UIColor {
        return UIColor(red: 61.0 / 255.0, green: 81.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0);
    }
    
    static var appSecondColor: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0);
    }
}
