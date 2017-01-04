//
//  Listing.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 1/1/17.
//  Copyright © 2017 HelpMeFindAVehicle.com. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Listing {
    var updateListings:     Int!    = nil
    var title:              String! = nil
    var description:        String! = nil
    var dealer:             String! = nil
    var price:              String! = nil
    var city_mpg:           String! = nil
    var highway_mpg:        String! = nil
    var stock_number:       String! = nil
    var stock_type:         String! = nil
    var year:               String! = nil
    var mileage:            String! = nil
    var transmission:       String! = nil
    var drivetrain:         String! = nil
    var engine:             String! = nil
    var exterior_color:     String! = nil
    var interior_color:     String! = nil
    var classification:     String! = nil
    var type_code:          String! = nil
    var view_count:         String! = nil
    var qr_code:            String! = nil
    var show_payment:       String! = nil
    var trim:               String! = nil
    var blue_book_low:      String! = nil
    var blue_book_high:     String! = nil
    var seating_capacity:   String! = nil
    var make:               String! = nil
    var model:              String! = nil
    var video:              String! = nil
    var vin_number:         String! = nil
    var features:           Array<String>! = nil
    var images_to_del:      String! = nil
    var feature_image:      String! = nil
    var gallery_images:     [String]! = nil
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
    init(json: JSON) {
         updateListings = json["updateListings"].int
         title          = json["title"].string
         description    = json["description"].string
         dealer         = json["dealer"].string
         price          = json["price"].string
         city_mpg       = json["city_mpg"].string
         highway_mpg    = json["highway_mpg"].string
         stock_number   = json["stock_number"].string
         stock_type     = json["stock_type"].string
         year           = json["year"].string
         mileage        = json["mileage"].string
         transmission   = json["transmission"].string
         drivetrain     = json["drivetrain"].string
         engine         = json["engine"].string
         exterior_color = json["exterior_color"].string
         interior_color = json["interior_color"].string
         classification = json["classification"].string
         type_code      = json["type_code"].string
         view_count     = json["view_count"].string
         qr_code        = json["qr_code"].string
         show_payment   = json["show_payment"].string
         trim           = json["trim"].string
         blue_book_low  = json["blue_book_low"].string
         blue_book_high = json["blue_book_high"].string
         seating_capacity   = json["seating_capacity"].string
         make           = json["make"].string
         model          = json["model"].string
         video          = json["video"].string
         vin_number     = json["vin_number"].string
         features       = json["features"].arrayObject as! Array<String>!
         images_to_del  = json["images_to_del"].string
         feature_image  = json["feature_image"].string
         gallery_images = json["gallery_images"].arrayObject as! Array<String>!
    }
    init() {
        //SET NEEDED VALUES
    }
    
}
