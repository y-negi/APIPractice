//
//  LoginAPI.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/19.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit

class LoginAPI: APIParameterProtocol {
    // req
    private var requestId: String?
    private var requestPassword: String?
    // res
    var responseIsLogin: Bool = false
    
    // protocol
    let url: String = "https://LoginAPI"
    var errorType: Int = 0
    var errorMessage: String = "errordayo"
    var parameter: NSDictionary = NSDictionary()
    
    func setParameter(id: String, pass: String) {
        requestId = id
        requestPassword = pass
        parameter = ["id": requestId ?? "", "pass": requestPassword ?? ""]
    }
}
