//
//  BaseViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/30/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        navigationController?.navigationBar.barTintColor = UIColor.appColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName : UIColor.white]
        setNeedsStatusBarAppearanceUpdate()
    }
}
