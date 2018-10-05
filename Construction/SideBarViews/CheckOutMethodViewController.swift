//
//  CheckOutMethodViewController.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CheckOutMethodViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var guestBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var newAccountBtn: UIButton!
    

    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CHECKOUT METHOD"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
        self.initialUI()
    }

    func initialUI() {
        continueBtn.layer.cornerRadius = 5
        continueBtn.layer.borderWidth = 1
        
        continueBtn.layer.shadowOpacity = 10.0
        continueBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        continueBtn.layer.shadowRadius = 3.0
        continueBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guestBtnClicked(_ sender: UIButton) {
        guestBtn.setImage(UIImage(named: "radioOn"), for: .normal)
        loginBtn.setImage(UIImage(named: "radioOff"), for: .normal)
        newAccountBtn.setImage(UIImage(named: "radioOff"), for: .normal)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guestBtn.setImage(UIImage(named: "radioOff"), for: .normal)
        loginBtn.setImage(UIImage(named: "radioOn"), for: .normal)
        newAccountBtn.setImage(UIImage(named: "radioOff"), for: .normal)
    }
    
    @IBAction func newAccountBtnClicked(_ sender: UIButton) {
        guestBtn.setImage(UIImage(named: "radioOff"), for: .normal)
        loginBtn.setImage(UIImage(named: "radioOff"), for: .normal)
        newAccountBtn.setImage(UIImage(named: "radioOn"), for: .normal)
    }
    
    @IBAction func continueBtnClicked(_ sender: UIButton) {
        //PaymentSelectionViewIdentifier
        let dealerListView = self.storyboard?.instantiateViewController(withIdentifier: "PaymentSelectionViewIdentifier") as! PaymentSelectionViewController
        self.navigationController?.pushViewController(dealerListView, animated: true)
    }
    
}
