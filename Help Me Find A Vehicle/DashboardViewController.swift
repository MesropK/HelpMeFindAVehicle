//
//  DashboardViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/30/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

struct AppUrls {
    static let webURL = URL(string: "http://www.helpmefindavehicle.com")!
}

class DashboardViewController: UITableViewController {

    //MARK: -properties
    @IBOutlet weak var dotsButton: UIBarButtonItem!
    @IBOutlet weak var vimViewContainer: UIView!
    @IBOutlet weak var vinTextField: UITextField!
    @IBOutlet var cellButtons: [UIButton]!
    
    //MARK: - lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.dataSource = self
        //loadRequest()
    }
    
    func loadRequest() {
        let getList = ListingSearchData(userID: 1, offset: 10, make: "acura", model: "MDX", year: 2008, searchKeyword: "keyword")
        NetworkManager.getListingBy(id: 2) { (listing) in
            var list = listing
            let detailController = Storyboard.controllers.detailListing
            detailController.listing = list
            self.present(detailController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      //  setupUI()
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
        navigationController?.navigationBar.tintColor = UIColor.white
        vimViewContainer.layer.cornerRadius = 5
        dotsButton?.title = "\u{22EE}"
    }
    
    //MARK: - tableView
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor.black
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerFrame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 8)
        let view = UIView(frame: headerFrame)
        view.backgroundColor = UIColor.black
        return view
    }
    
    //MARK: - Actions
    @IBAction func inventotyListTapped(_ sender: UIButton) {
       let listingList =  Storyboard.controllers.listingsList
        present(Storyboard.controllers.listingsListNav, animated: true, completion: nil)
//        navigationController?.pushViewController(listingList, animated: true)
    }
    @IBAction func ourWebsiteButtonAction(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(AppUrls.webURL) {
            UIApplication.shared.openURL(AppUrls.webURL)
        }
    }
    var logoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5.0
        button.setTitleColor(UIColor.appColor, for: .normal)
        return button
    }()
    
    var isLogoutButtonEnabled = false
    @IBAction func dotsButtonAction(_ sender: UIBarButtonItem) {
        var newItems = [dotsButton!]
        if !isLogoutButtonEnabled {
            let logOutItem = UIBarButtonItem(customView: logoutButton)
            logoutButton.addTarget(self, action: #selector(self.logOut), for: .touchUpInside)
            newItems += [logOutItem]
        }
        navigationItem.setRightBarButtonItems(newItems, animated: true)
        isLogoutButtonEnabled = !isLogoutButtonEnabled
    }
    
    func logOut() {
        
    }
    
}
