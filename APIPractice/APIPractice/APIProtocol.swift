
//
//  APIProtocol.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import AFNetworking

protocol APIParameterProtocol: class {
    var url: String { get }
    var errorType: Int { set get }
    var errorMessage: String { set get }
    var requestParameter: Dictionary<String, Any> { get }
    func setResponseParameter(responseObject: Dictionary<String, Any>)
}

extension APIParameterProtocol {
    
    /// POST通信
    ///
    /// - Parameter closure: レスポンスを呼び出し側に返すためのクロージャ
    /// 呼び出し側はクロージャ内での循環参照に注意
    func postRequest(closure: @escaping (_ responseObject: Self) -> ()) {
        
        let manager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        let serializer:AFJSONRequestSerializer = AFJSONRequestSerializer()
        
        manager.requestSerializer = serializer
        
        manager.post(url,
                     parameters: requestParameter,
                     success: { (operation: AFHTTPRequestOperation, responsobject: Any) in
                        let responseDic: Dictionary<String, Any> = responsobject as! Dictionary<String, Any>
                        self.setResponseParameter(responseObject: responseDic)
                        closure(self)
        },
                     failure: { (operation: AFHTTPRequestOperation?, error: Error) in
                        self.errorType = 1
                        self.errorMessage = "えらー"
                        closure(self)
        })

        
    }
}
