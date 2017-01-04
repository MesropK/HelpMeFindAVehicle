//
//  SearchListing.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 1/1/17.
//  Copyright © 2017 HelpMeFindAVehicle.com. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK: Listing
struct  ListingSearchData {
    let getListings = true
    var userID: Int!   = nil
    var offset: Int!   = nil
    var make:  String! = nil
    var model: String! = nil
    var year:  Int!    = nil
    var searchKeyword: String! = nil
    var parameter: RestCallParameterType {
        var parameter =  RestCallParameterType()
        parameter["getListings"] = getListings
        parameter["userID"] = userID
        parameter["offset"] = offset
        parameter["make"] = make
        parameter["model"] = model
        parameter["year"] = year
        parameter["search"] = searchKeyword
        return parameter
    }
//    init(json: JSON) {
//        userID =  json["userID"].int
//        offset =  json["offset"].int
//        make   =  json["make"].string
//        model  =  json["model"].string
//        year   =  json["year"].int
//        searchKeyword =  json["search"].string
//    }
//    init(year: Int, make: String, model: String) {
//        self.year  = year
//        self.model = model
//        self.make  = make
//    }
//    init(searchKeyword: String){
//        self.searchKeyword = searchKeyword
//    }
//    init(offset: Int) {
//        self.offset = offset
//    }
}
