//
//  NetworkManager.swift
//  Help Me Find A Vehicle
//
//  Created by Mesrop Kareyan on 12/31/16.
//  Copyright © 2016 HelpMeFindAVehicle.com. All rights reserved.
//

import Foundation
import Alamofire


class NetworkManger {
    
    //MARK: - login
    static func loginWithUser(forUser: UserLoginData, result: @escaping (Bool) -> ()) {
        Alamofire.request(RestCall.login.value.url.rawValue, method: .get, parameters: RestCall.login.value.paremeters).responseString { (responese) in
            if responese.result.value != nil {
                result(true)
            } else {
                result(false)
            }
        }
    }
    //MARK: - 
}
