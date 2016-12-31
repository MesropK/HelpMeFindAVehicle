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
//MARK: - Data
//MARK: Listing
struct  GetListings {
    let getListings = true
    let userID: Int
    let offset: Int
    let make:  String
    let model: String
    let year:  Int
    let search:String
    var parameter: RestCallParameterType {
        var parameter =  RestCallParameterType()
        parameter["getListings"] = getListings
        parameter["userID"] = userID
        parameter["offset"] = offset
        parameter["make"] = make
        parameter["model"] = model
        parameter["year"] = year
        parameter[search] = search
        return parameter
    }
}
//MARK: Listing
struct ListingData {
    let updateListings:     Int!
    var title:              String!
    var description:        String!
    var dealer:             String!
    var price:              String!
    var city_mpg:           String!
    var highway_mpg:        String!
    var stock_number:       String!
    var stock_type:         String!
    var year:               String!
    var mileage:            String!
    var transmission:       String!
    var drivetrain:         String!
    var engine:             String!
    var exterior_color:     String!
    var interior_color:     String!
    var classification:     String!
    var type_code:          String!
    var view_count:         String!
    var qr_code:            String!
    var show_payment:       String!
    var trim:               String!
    var blue_book_low:      String!
    var blue_book_high:     String!
    var seating_capacity:   String!
    var make:               String!
    var model:              String!
    var video:              String!
    var vin_number:         String!
    var features:           String!
    var images_to_del:      String!
    var feature_image:      String!
    init(_ type: ListingModification) {
        switch type {
        case .create:
            updateListings = nil
        case .update(forID: let id):
            updateListings = id
        }
    }
    var parameter: RestCallParameterType {
        var parameter =  RestCallParameterType()
        if let title = self.title{
            parameter["title"] = title
        }
        if let description = self.description{
            parameter["description"] = description
        }
        if let dealer = self.dealer{
            parameter["dealer"] = dealer
        }
        if let price = self.price{
            parameter["price"] = price
        }
        if let city_mpg = self.city_mpg{
            parameter["city_mpg"] = city_mpg
        }
        if let highway_mpg = self.highway_mpg{
            parameter["highway_mpg"] = highway_mpg
        }
        if let stock_number = self.stock_number{
            parameter["highway_mpg"] = stock_number
        }
        if let stock_type = self.stock_type{
            parameter["stock_type"] = stock_type
        }
        if let year = self.year{
            parameter["year"] = year
        }
        if let mileage = self.mileage{
            parameter["mileage"] = mileage
        }
        if let transmission = self.transmission{
            parameter["transmission"] = transmission
        }
        if let drivetrain = self.drivetrain{
            parameter["drivetrain"] = drivetrain
        }
        if let engine = self.engine{
            parameter["engine"] = engine
        }
        if let exterior_color = self.exterior_color{
            parameter["exterior_color"] = exterior_color
        }
        if let interior_color = self.interior_color{
            parameter["interior_color"] = interior_color
        }
        if let classification = self.classification{
            parameter["classification"] = classification
        }
        if let type_code = self.type_code{
            parameter["type_code"] = type_code
        }
        if let view_count = self.view_count{
            parameter["view_count"] = view_count
        }
        if let qr_code = self.qr_code{
            parameter["qr_code"] = qr_code
        }
        if let show_payment = self.show_payment{
            parameter["show_payment"] = show_payment
        }
        if let trim = self.trim{
            parameter["trim"] = trim
        }
        if let blue_book_low = self.blue_book_low{
            parameter["blue_book_low"] = blue_book_low
        }
        if let blue_book_high = self.blue_book_high{
            parameter["blue_book_high"] = blue_book_high
        }
        if let seating_capacity = self.seating_capacity{
            parameter["seating_capacity"] = seating_capacity
        }
        if let make = self.make{
            parameter["make"] = make
        }
        if let model = self.model{
            parameter["model"] = model
        }
        if let video = self.video{
            parameter["video"] = video
        }
        if let vin_number = self.vin_number{
            parameter["vin_number"] = vin_number
        }
        if let features = self.features{
            parameter["features"] = features
        }
        if let images_to_del = self.images_to_del{
            parameter["images_to_del"] = images_to_del
        }
        if let feature_image = self.feature_image{
            parameter["feature_image"] = feature_image
        }
        return parameter

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
    static func getListings(for listing: GetListings) -> RestCallParameterType {
        return listing.parameter
    }
    static func createListing(for listing: GetListings) -> RestCallParameterType {
        return listing.parameter
    }
    static func updateListing(for listing: GetListings) -> RestCallParameterType {
        return listing.parameter
    }

}

enum RestCall {
    case login
    var value: RestCallValue {
        switch self {
        case .login:
            return RestCallValue(url: .base, type: .get, paremeters: RestCallParameter.adminLogin)
        }
    }
}

struct RestCallValue  {
    let url:  RestCallAdress
    let type: RestCallType
    let paremeters: RestCallParameterType?
}
