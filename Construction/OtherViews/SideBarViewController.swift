//
//  SideBarViewController.swift
//  Construction
//
//  Created by apple on 26/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class SideBarViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var viewForHomeBtn: UIView!
    @IBOutlet weak var viewforMyAccount: UIView!
    @IBOutlet weak var myRFQView: UIView!
    @IBOutlet weak var myQuotView: UIView!
    @IBOutlet weak var myOrderView: UIView!
    @IBOutlet weak var orderTrackingView: UIView!
    @IBOutlet weak var PaymentView: UIView!
    @IBOutlet weak var feedBackView: UIView!
    
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initailSetup()
    }
    
    func initailSetup() {
        viewForHomeBtn.layer.borderWidth = 1.5
        viewForHomeBtn.layer.borderColor = UIColor.black.cgColor
        viewForHomeBtn.layer.cornerRadius = 5
        viewForHomeBtn.layer.shadowOpacity = 10.0
        viewForHomeBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewForHomeBtn.layer.shadowRadius = 3.0
        viewForHomeBtn.layer.shadowColor = UIColor.lightGray.cgColor
      
        viewforMyAccount.layer.borderWidth = 1.5
        viewforMyAccount.layer.borderColor = UIColor.black.cgColor
        viewforMyAccount.layer.cornerRadius = 5
        viewforMyAccount.layer.shadowOpacity = 10.0
        viewforMyAccount.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        viewforMyAccount.layer.shadowRadius = 3.0
        viewforMyAccount.layer.shadowColor = UIColor.lightGray.cgColor
        
        myRFQView.layer.borderWidth = 1.5
        myRFQView.layer.borderColor = UIColor.black.cgColor
        myRFQView.layer.cornerRadius = 5
        myRFQView.layer.shadowOpacity = 10.0
        myRFQView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        myRFQView.layer.shadowRadius = 3.0
        myRFQView.layer.shadowColor = UIColor.lightGray.cgColor
        
        myQuotView.layer.borderWidth = 1.5
        myQuotView.layer.borderColor = UIColor.black.cgColor
        myQuotView.layer.cornerRadius = 5
        myQuotView.layer.shadowOpacity = 10.0
        myQuotView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        myQuotView.layer.shadowRadius = 3.0
        myQuotView.layer.shadowColor = UIColor.lightGray.cgColor
        
        myOrderView.layer.borderWidth = 1.5
        myOrderView.layer.borderColor = UIColor.black.cgColor
        myOrderView.layer.cornerRadius = 5
        myOrderView.layer.shadowOpacity = 10.0
        myOrderView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        myOrderView.layer.shadowRadius = 3.0
        myOrderView.layer.shadowColor = UIColor.lightGray.cgColor

        orderTrackingView.layer.borderWidth = 1.5
        orderTrackingView.layer.borderColor = UIColor.black.cgColor
        orderTrackingView.layer.cornerRadius = 5
        orderTrackingView.layer.shadowOpacity = 10.0
        orderTrackingView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        orderTrackingView.layer.shadowRadius = 3.0
        orderTrackingView.layer.shadowColor = UIColor.lightGray.cgColor

        PaymentView.layer.borderWidth = 1.5
        PaymentView.layer.borderColor = UIColor.black.cgColor
        PaymentView.layer.cornerRadius = 5
        PaymentView.layer.shadowOpacity = 10.0
        PaymentView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        PaymentView.layer.shadowRadius = 3.0
        PaymentView.layer.shadowColor = UIColor.lightGray.cgColor

        feedBackView.layer.borderWidth = 1.5
        feedBackView.layer.borderColor = UIColor.black.cgColor
        feedBackView.layer.cornerRadius = 5
        feedBackView.layer.shadowOpacity = 10.0
        feedBackView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        feedBackView.layer.shadowRadius = 3.0
        feedBackView.layer.shadowColor = UIColor.lightGray.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func homeBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func myAccountBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func myRFQBtnCLicked(_ sender: UIButton) {
        //myRFQIdentifier
         performSegue(withIdentifier: "myRFQIdentifier", sender: self)
    }
    
    @IBAction func myQuotBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func myOrderBtnClicked(_ sender: UIButton) {
         performSegue(withIdentifier: "OrderSegueIdentifier", sender: self)
    }
    
    @IBAction func ordeeTrackingBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func paymentBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func feedbackBtnClicked(_ sender: UIButton) {
    }
}
