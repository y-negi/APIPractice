//
//  APIClient.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit
import AFNetworking
import SVProgressHUD

class APIClient: NSObject {
    
    func postRequest() {
        let manager = AFHTTPRequestOperationManager()
        
        manager.post("url",
                     parameters: "hoge",
                     success: { (operation: AFHTTPRequestOperation, responsobject: Any) in
                        //
        },
                     failure: { (operation: AFHTTPRequestOperation?, error: Error) in
            //
        })
        
        
        SVProgressHUD.show()
    }

}
