//
//  RestCallData.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/31/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import Foundation

//MARK: - Types

typealias RestCallParameterType = Dictionary<String, Any>

enum RestCallType {
    case get
    case post
}

enum ListingModification {
    case create
    case update(forID: Int)
}

enum RestCallAdress : String {
    case base = "http://helpmefindavehicle.com/wp-admin/admin-ajax.php"
}

struct RestCallValue  {
    let url:  RestCallAdress
    let type: RestCallType
    let paremeters: RestCallParameterType?
}

//MARK: - Data
enum RestCall {
    case login
    case getMakes
    case getDealers
    case getListing(id: Int)
    case getListings(data: ListingSearchData)
    case createListing(listing: Listing)
    case updateListing(listing: Listing)
    var value: RestCallValue {
        switch self {
        case .login:
            return RestCallValue(url: .base, type: .get, paremeters: RestCallParameter.adminLogin)
        case .getMakes:
            return RestCallValue(url: .base, type: .get, paremeters: RestCallParameter.getMakes)
        case .getDealers:
            return RestCallValue(url: .base, type: .get, paremeters: RestCallParameter.getDealers)
        case .getListing(id: let listingID):
            return RestCallValue(url: .base, type: .get, paremeters: RestCallParameter.getListing(for: listingID))
        case .getListings(data: let listings):
            return RestCallValue(url: .base, type: .get, paremeters: RestCallParameter.getListings(for: listings))
        case .createListing(listing: let list):
            return RestCallValue(url: .base, type: .post, paremeters: RestCallParameter.createListing(for: list))
        case .updateListing(listing: let list):
            return RestCallValue(url: .base, type: .post, paremeters: RestCallParameter.updateListing(for: list))
        }
    }
    //computed
    var callURL: String {
       return self.value.url.rawValue
    }
    var callParameters: RestCallParameterType! {
        return self.value.paremeters
    }
}

//MARK: - Parameters
struct RestCallParameter {
    static let adminLogin : RestCallParameterType  = [ "check_user" : true,
                                                       "user_name"  : "admin",
                                                       "user_pass"  : "helpme16"]
    static func loginFor(user: UserLoginData) -> RestCallParameterType {
        return [ "check_user" : true,
                 "user_name"  : user.login,
                 "user_pass"  : user.password
        ]
    }
    static let  getMakes : RestCallParameterType   = ["get_makes" : true]
    static let  getDealers : RestCallParameterType = ["get_dealers" : true]
    static func getListing(for listingID: Int) -> RestCallParameterType {
        return ["get_listing" : listingID]
    }
    static func getListings(for listing: ListingSearchData) -> RestCallParameterType {
        return listing.parameter
    }
    static func createListing(for listing: Listing) -> RestCallParameterType {
        return listing.parameter
    }
    static func updateListing(for listing: Listing) -> RestCallParameterType {
        return listing.parameter
    }

}



