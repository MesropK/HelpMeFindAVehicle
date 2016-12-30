//
//  DashboardViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/30/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

class DashboardViewController: UITableViewController {

    @IBOutlet weak var vinTextField: UITextField!
    @IBOutlet var cellButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationController?.navigationBar.barTintColor = UIColor.appColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName : UIColor.white]
        setNeedsStatusBarAppearanceUpdate()
        for button in cellButtons {
            button.clipsToBounds = true
            button.layer.cornerRadius = 5;
            button.backgroundColor = UIColor.appColor
        }
        vinTextField.transform = CGAffineTransform(scaleX: 1, y: 44 / 30.0)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
