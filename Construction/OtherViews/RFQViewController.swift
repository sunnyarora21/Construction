//
//  RFQViewController.swift
//  Construction
//
//  Created by apple on 26/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class RFQViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var quantityTxtField: UITextField!
    @IBOutlet weak var unitOfMeasurementTxtField: UITextField!
    @IBOutlet weak var deliveryTimeTxtField: UITextField!
    @IBOutlet weak var locationTxtField: UITextField!
    
    
    //MARK:- Variables
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "RFQ"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK:- Button Actions
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendRFQBtnClicked(_ sender: UIButton) {
        if !quantityTxtField.hasText{
            Utility.showAlert(title: "Alert", message: "Please add quantity for Quotations.", viewController: self)
        }
        else if !unitOfMeasurementTxtField.hasText{
             Utility.showAlert(title: "Alert", message: "Please add unit of measurement for Quotations.", viewController: self)
        }
        else if !deliveryTimeTxtField.hasText{
             Utility.showAlert(title: "Alert", message: "Please add delivery date for Quotations.", viewController: self)
        }
        else if !locationTxtField.hasText{
             Utility.showAlert(title: "Alert", message: "Please add location for delivery.", viewController: self)
        }
        else{
            Utility.showAlert(title: "Sucess!!", message: "Your request for Quotations is submitted.", viewController: self)
        }
    }
}
