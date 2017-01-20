//
//  ViewController.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 呼び出すAPIのパラメータを生成
        let login = LoginAPI()
        // リクエストパラメータを詰める
        login.setRequestParameter(id: "あいでぃ", pass: "ぱす")
        // POST通信を行う
        login.postRequest { (responseObject: LoginAPI) in
            dump(responseObject)
        }
    }

}

