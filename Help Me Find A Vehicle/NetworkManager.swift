//
//  NetworkManager.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/31/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    //MARK: - login
    static func loginWithUser(forUser: UserLoginData, result: @escaping (Bool) -> ()) {
        Alamofire.request(RestCall.login.callURL, method: .get, parameters: RestCall.login.callParameters).responseString { (responese) in
            if responese.result.value != nil {
                result(true)
            } else {
                result(false)
            }
        }
    }
    //MARK: - makes
    static func getMakes(result: (Bool) -> Void){
        Alamofire.request(RestCall.getMakes.callURL, method: .get, parameters: RestCall.getMakes.callParameters).responseString { (response) in
        }
    }
    //MARK: - makes
    static func getDealers(result: (Bool) -> Void){
        Alamofire.request(RestCall.getMakes.callURL, method: .get, parameters: RestCall.getDealers.callParameters).responseString { (response) in
        }
    }
    //MARK: - Listings
    //Get
    static func getListings(data: ListingSearchData, result: @escaping ([Listing]!) -> Void) {
        let  listing = RestCall.getListings(data: data)
        Alamofire.request(listing.callURL, method: HTTPMethod.get, parameters: listing.callParameters).responseData { response in
            var listingsResultsArray = [Listing]()
            switch response.result {
            case .success(let value):
                let listingsJson = JSON(value)
                for listingJson in listingsJson.array! {
                    let listing = Listing(json: listingJson)
                    listingsResultsArray.append(listing)
                }
                result(listingsResultsArray)
            case .failure(let error):
                result(nil)
            }
            
        }
    }
    static func getListingBy(id: Int, completion: @escaping (Listing) -> Void) {
        let listing = RestCall.getListing(id: id)
        Alamofire.request(listing.callURL, method: .get, parameters: listing.callParameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let listing = Listing(json: json)
                completion(listing)
            case .failure(let error):
                print(error)
            }
        }
    }
    //MARK: - create listing
    static func create(listing: Listing, completion: @escaping (Listing) -> Void) {
        let newListing = RestCall.createListing(listing: listing)
        Alamofire.request(newListing.callURL, method: .post, parameters: newListing.callParameters).responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
                completion(listing)
            case .failure(let error):
                print(error)
            }
        }
    }
    static func update(listing: Listing, completion: @escaping (Listing) -> Void) {
        let newListing = RestCall.updateListing(listing: listing)
        Alamofire.request(newListing.callURL, method: .post, parameters: newListing.callParameters).responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
                completion(listing)
            case .failure(let error):
                print(error)
            }
        }
    }


}
