//
//  ListingViewController.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 1/1/17.
//  Copyright © 2017 HelpMeFindAVehicle.com. All rights reserved.
//

import UIKit

class ListingsListViewControler: UIViewController {
    
    var listings: [Listing]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var listingsCountlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListings()
    }
    
    func loadListings() {
        var getListings = ListingSearchData(userID: 1, offset: 10, make: "acura", model: "MDX", year: 2008, searchKeyword: "keyword")
        NetworkManager.getListings(data: getListings) { (result) in
            self.listings = result
        }
    }
}

extension ListingsListViewControler: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listingCell") as! ListingListCell
        
        return cell
    }
    
}
