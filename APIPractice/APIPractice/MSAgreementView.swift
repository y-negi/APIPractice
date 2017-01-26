//
//  MSAgreementView.swift
//  APIPractice
//
//  Created by 根岸 裕太 on 2017/01/23.
//  Copyright © 2017年 根岸裕太. All rights reserved.
//

import UIKit

protocol MSAgreementViewDelegate: class {
    func shouldDismissAgreementView(isAgreement: Bool) -> Void
}

class MSAgreementView: NSObject {
    
    private static let className = "MSAgreementView"
    
    var agreementType: Int
    
    weak var agreementViewDelegate: MSAgreementViewDelegate?
    
    @IBOutlet var customDialog: UIView!
    
    // CustomDialogのパーツ
    @IBOutlet var nameLabel: UILabel!
    
    // MARK: IBActions
    
    @IBAction func closeButtonTapped(sender: UIButton) {
        agreementViewDelegate?.shouldDismissAgreementView(isAgreement: false)
    }
    
    // MARK: Initialize
    
    override init() {
        agreementType = 0
        super.init()
        Bundle.main.loadNibNamed(MSAgreementView.className, owner: self, options: nil)
    }
    
    // MARK: Public Methods
    
    func show(presentedView: UIView?, requestAgreementType: Int) {
        if let unwrappedPresentedView = presentedView {
            customDialog.frame = unwrappedPresentedView.frame
            agreementType = requestAgreementType
            
            unwrappedPresentedView.addSubview(customDialog)
        } else {
            fatalError("View is Nil!")
        }
    }
    
    func hide() {
        customDialog.removeFromSuperview()
    }

}
