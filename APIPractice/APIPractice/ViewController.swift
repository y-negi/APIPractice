//
//  ViewController.swift
//  APIPractice
//
//  Created by 根岸裕太 on 2017/01/18.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MSAgreementViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var agreementView: MSAgreementView = MSAgreementView()
    
    var fruits = ["Apple", "Strawberry", "Cherry", "Banana", "Grape", "Peach", "Melon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 呼び出すAPIのパラメータを生成
        let login = LoginAPI()
        // リクエストパラメータを詰める
        login.setRequestParameter(id: "あいでぃ", pass: "ぱす")
        // POST通信を行う
        login.postRequest { (responseObject: LoginAPI) in
            dump(responseObject)
        }
        
        agreementView.agreementViewDelegate = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Storyboardで設定したIdentifierでUITableViewCellのインスタンスを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // StoryboardでCellを作成しない場合
        // let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        // セルにテキストを設定
        cell.textLabel?.text = fruits[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        self.navigationController?.view.addSubview(agreementView)
        agreementView.show(presentedView: self.navigationController?.view, requestAgreementType: 1)
        
    }
    
    func shouldDismissAgreementView(isAgreement: Bool) {
        agreementView.hide()
    }
    
}

