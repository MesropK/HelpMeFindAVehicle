//
//  File.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/30/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit
//MARK: Storyboard

enum IdForController: String {
    case dashboard       = "dashboardController"
    case login           = "loginController"
    case dashboardNav    = "dashboardNavigationController"
    case leitingDetail   = "detailListing"
    case listingsList    = "ListingListViewController"
    case listingsListNav = "ListingListViewControllerNav"
}

struct Controllers {
    
    var dashboard: DashboardViewController  {
       let controller = Storyboard.main.instantiateViewController(withIdentifier: IdForController.dashboard.rawValue)
        return controller as! DashboardViewController
    }
    
    var dashboardNav: UINavigationController  {
        let controller = Storyboard.main.instantiateViewController(withIdentifier: IdForController.dashboardNav.rawValue)
        return controller as! UINavigationController
    }
    
    var login: LoginViewController  {
        let controller =  Storyboard.main.instantiateViewController(withIdentifier: IdForController.login.rawValue)
        return controller as! LoginViewController
    }
    var detailListing: ListingDetailViewController {
        let controller =  Storyboard.main.instantiateViewController(withIdentifier: IdForController.leitingDetail.rawValue)
        return controller as! ListingDetailViewController
    }
    
    var listingsList: ListingsListViewControler {
        let controller =  Storyboard.main.instantiateViewController(withIdentifier: IdForController.listingsList.rawValue)
        return controller as! ListingsListViewControler
    }
    
    var listingsListNav: UINavigationController {
        let controller =  Storyboard.main.instantiateViewController(withIdentifier: IdForController.listingsListNav.rawValue)
        return controller as! UINavigationController
    }
    

}

class Storyboard {
    static let main = UIStoryboard(name: "Main", bundle: Bundle.main)
    static let controllers: Controllers = Controllers()
}

