//
//  PaymentSelectionViewController.swift
//  Construction
//
//  Created by apple on 27/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class PaymentSelectionViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var bankBtn: UIButton!
    @IBOutlet weak var cardBtn: UIButton!
    
    @IBOutlet weak var placeOrderBtn: UIButton!
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initialUI()
    }
    
    func initialUI() {
        placeOrderBtn.layer.cornerRadius = 5
        placeOrderBtn.layer.borderWidth = 1
        
        placeOrderBtn.layer.shadowOpacity = 10.0
        placeOrderBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        placeOrderBtn.layer.shadowRadius = 3.0
        placeOrderBtn.layer.shadowColor = UIColor.lightGray.cgColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bankBtnClicked(_ sender: UIButton) {
        bankBtn.setImage(UIImage(named: "radioOn"), for: .normal)
        cardBtn.setImage(UIImage(named: "radioOff"), for: .normal)
    }
    
    @IBAction func cardBtnClicked(_ sender: UIButton) {
        bankBtn.setImage(UIImage(named: "radioOn"), for: .normal)
        cardBtn.setImage(UIImage(named: "radioOff"), for: .normal)
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        
    }

}
