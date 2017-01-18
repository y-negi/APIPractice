
//
//  APIProtocol.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit

protocol APIParameterProtocol: class {
    var url: String { get }
    var errorType: Int { get }
    var errorMessage: String { get }
    var parameter: NSDictionary { get }
    func postRequest()
}

extension APIParameterProtocol {
    func postRequest() {
        print("url:" + url)
        print("param:" + String(describing: parameter))
    }
}
