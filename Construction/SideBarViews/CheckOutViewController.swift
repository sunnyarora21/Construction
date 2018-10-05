//
//  CheckOutViewController.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    
    //MARK:- Outlets
    @IBOutlet weak var couponTxtField: UITextField!
    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var checkoutBtn: UIButton!
    
    
    //MARK:- Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Checkout"
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        self.intialSetUp()
    }

    func intialSetUp() {
        applyBtn.layer.shadowOpacity = 10.0
        applyBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        applyBtn.layer.shadowRadius = 3.0
        applyBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
        checkoutBtn.layer.shadowOpacity = 10.0
        checkoutBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        checkoutBtn.layer.shadowRadius = 3.0
        checkoutBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func applyCouponBtnClicked(_ sender: UIButton) {
        if !couponTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please enter a valid coupon code.", viewController: self)
        }
    }
    
    @IBAction func checkOutBtnClicked(_ sender: UIButton) {
        //CheckOutMethodViewIdentifier
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "AddressListViewIdentifier") as! AddressListViewController
        self.navigationController?.pushViewController(dealerListView, animated: true)
    }
    
    
}
