//
//  AddressListViewController.swift
//  Construction
//
//  Created by apple on 28/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class AddressListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var addAddressLbl: UILabel!
    @IBOutlet weak var addresssListLbl: UILabel!
    @IBOutlet weak var viewForCurrentLocation: UIView!
    @IBOutlet weak var selectedlocationTxtField: UITextField!
    @IBOutlet weak var currentLocationBtn: UIButton!
    @IBOutlet weak var selectLocationBtn: UIButton!
    @IBOutlet weak var addressListTableView: UITableView!
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var selectAddressBtn: UIButton!
    
    
    //MARK:- Variables
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Select Delivery Address"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
         addressListTableView.register(UINib(nibName: "DeliveryListTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliveryListTableViewCellIdentifier")
        self.initialUI()
    }

    
    func initialUI() {
        viewForCurrentLocation.layer.cornerRadius = 5
        viewForCurrentLocation.layer.borderWidth = 1
        
        selectAddressBtn.layer.shadowOpacity = 10.0
        selectAddressBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        selectAddressBtn.layer.shadowRadius = 3.0
        selectAddressBtn.layer.shadowColor = UIColor.lightGray.cgColor
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:- TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell
    {
        let cell:DeliveryListTableViewCell = tableView.dequeueReusableCell (withIdentifier: "DeliveryListTableViewCellIdentifier") as! DeliveryListTableViewCell
        // cell.cartDelegate = self
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 145
        
    }

    @IBAction func currentLocationBtnClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func selectLocationBtnClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func continueBtnClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func selectAddressBtnClicked(_ sender: UIButton) {
        
    }
    
}
